#setwd("~/Downloads/capture-the-feature-flag")

library(readr)
library(lmerTest)
require(MuMIn)

# if psycho the method analyze does not does not exist you can run the following 
# remove.packages("psycho")
# devtools::install_github("neuropsychology/psycho.R@0.4.0")

library(psycho)
library(survival)
library(survminer)
library(ggplot2)

vif.mer <- function (fit) {
  ## adapted from rms::vif
  
  v <- vcov(fit)
  nam <- names(fixef(fit))
  
  ## exclude intercepts
  ns <- sum(1 * (nam == "Intercept" | nam == "(Intercept)"))
  if (ns > 0) {
    v <- v[-(1:ns), -(1:ns), drop = FALSE]
    nam <- nam[-(1:ns)]
  }
  
  d <- diag(v)^0.5
  v <- diag(solve(v/(d %o% d)))
  names(v) <- nam
  v
}



flags = read_csv("featureflags.csv")

# Data preprocessing

names(flags)
str(flags)

flags$X1 = NULL

table(flags$removed)

table(flags$has_issue)
flags$has_issue_bool = flags$has_issue
flags[flags$has_issue_bool == "Not removed",]$has_issue_bool = FALSE
flags$has_issue_bool = as.logical(flags$has_issue_bool)
table(flags$has_issue_bool)

table(flags$same_author)
flags$same_author_bool = flags$same_author
flags[flags$same_author_bool == "Not removed",]$same_author_bool = FALSE
flags$same_author_bool = as.logical(flags$same_author_bool)
table(flags$same_author_bool)

# hist(flags$age)
# summary(flags$age)
# table(flags$age == 0)
# hist(log(flags$age + 1))

flags$language = as.factor(flags$language)
flags$slug = as.factor(flags$slug)


# Regression analysis

flags.s.removed = subset(flags, removed == TRUE
                         & seconds > 0
                         & age <= 3660)

m3 = lmer(age ~ 
            # scale(authors)
          + scale(commits)
          + has_issue_bool
          + same_author_bool
          + (1|slug)
          , data = flags.s.removed
          , REML = FALSE
          , control = lmerControl(optimizer ="Nelder_Mead"))
vif.mer(m3)
summary(m3)
r.squaredGLMM(m3)
anova(m3)

results = analyze(m3, CI = 95)
print(results)


# Survival KM estimator plot

flags.plot = subset(flags, 
                 age <= 3660)
ggsurvplot(
  survfit(Surv(flags.plot$age, 
               flags.plot$removed) ~ 1, 
          data = flags.plot),
  xlab = "Time in years",   # customize X axis label.
  break.time.by = 365,     # break X axis in time intervals by 500.
  legend = "none",
  size = 1,                 # change line size
  conf.int = TRUE,
  censor = FALSE,
  surv.scale = "percent",
  ggtheme = theme_light()
)$plot + scale_x_continuous(breaks = sort(seq(0, 4150, 365)),
                            labels = sort(seq(0, 11, 1)))
ggsave("flags-survival.pdf", width = 4, height = 2)



