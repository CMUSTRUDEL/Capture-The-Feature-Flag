# Capture The Feature Flag: Detecting Feature Flags in Open-Source
Jens Meinicke, Juan David Hoyos Rentería, Bogdan Vasilescu, Christian Kästner *Capture The Feature Flag: Detecting Feature Flags in Open-Source* In Proceedings of the International Conference on Mining Software Repositories (MSR), 2020.

This repository contains sublemental material for our MSR 2020 paper.

## Chapter 3 (Capturing Feature Flags): 
The script for identifying feature flagging projects can be viewed here: [Commit Analysis.ipynb](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Capturing-Feature-Flags/Commits%20Analysis.ipynb)

The file [candidate_projects.csv](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Capturing-Feature-Flags/candidate_projects.csv) contains slugs of candidate feature flagging projects after cleaning and filtering.

The file [feature_flag_projects.csv](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Capturing-Feature-Flags/feature_flag_projects.csv) contains list of feature flagging projects that we manually confirmed.

The file [likely_projects.csv](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Capturing-Feature-Flags/likely_projects.csv) contains list of projects that we found are very likely to use feature flagging.

The file [projects.json](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Capturing-Feature-Flags/projects.json) contains the pattern and file paths for the 100 classified projects used to collect the history of all feature flags. 

## Chapter 4 (Preliminary Feature Flag Study): 

The script for statistics and some initial analysis of feature flagging projects can be viewed here: [Flag_Analysis.ipynb](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Preliminary-Study/Flag_Analysis.ipynb)

The file [featureflags.csv](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Preliminary-Study/featureflags.csv) contains data on all feature flags for all 100 open-source feature flagging projects.

The archive [resources.zip](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Preliminary-Study/resources.zip) contains all feature flagging commits for all 100 projects.

The archive [results.zip](https://github.com/CMUSTRUDEL/Capture-The-Feature-Flag/blob/master/Preliminary-Study/results.zip) contains some visualizations of the feature flagging histories of the 100 projects. 
