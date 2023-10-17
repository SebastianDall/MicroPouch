# MicroPouch

## Abstract
Objective: To investigate if treatment with non-pooled multi-donor faecal microbiota transplantation (FMT) for four weeks was superior to placebo for inducing clinical remission in patients with chronic pouchitis. 
Design: The study was a randomised placebo-controlled study with a 4-week intervention period and 12 months follow-up. Eligible patients with chronic pouchitis were recruited from five Danish hospitals. Patients were randomised to treatment with non-pooled multi-donor FMT derived from four faecal donors, or placebo. The study treatment was delivered by enema daily for two weeks followed by every second day for two weeks. Disease severity was accessed before and after treatment at 30-day follow-up, using the Pouchitis Disease Activity Index (PDAI). A PDAI <7 was considered equivalent to clinical remission. The gut microbiota in faecal samples from patients and donors was analysed using shotgun metagenomic sequencing.
Results: 30 patients were included and randomised 1:1 to treatment with FMT or placebo. There was no difference in patients achieving clinical remission between the two groups at 30-day follow-up RR 1.0 (95% CI (0.55;1.81)). The mean difference for PDAI at 30-day follow-up decreased significantly for both groups, with a decrease of 1.83 (95% CI (0.33;3.34)) for the FMT group and 2.57 (95% CI (1.13;4.02)) for the placebo group, but no absolute difference was observed between groups (0.40, 95% CI (-1.62;2.43)). FMT treatment increased the similarity of the patient faecal microbiome to the faecal donor microbiome, which was not seen after placebo treatment.
Conclusion: Non-pooled multi-donor FMT was equal to placebo for inducing clinical remission in patients with chronic pouchitis. 

## Microbiome Analysis

This repository contains the code used for generating the microbiome analysis. All scripts for code generation can be found in `src` folder.

### Heatmaps

`src/heatmaps.Rmd` will produce the heatmaps.

### Alpha/beta diversity

`src/alpha-beta_diversity.Rmd` will produce the alpha and beta diversity plots.

Richness was defined as species with a relative abundance >0 and alpha diversity was calculated using the Shannon diversity index. Patient sample similarity to donors were calculated using both Sørensen coefficient on relative abundances and Bray-Curtis on Hellinger transformed relative abundances. The similarity would be measured as the median similarity to donor samples received and also as median similarity to a donor sample from each donor not received. For the placebo group, similarity was calculated as the median similarity to a donor sample from each donor used in the FMT group.

### Ordination

`src/ordinationplot.Rmd` produces the ordination plots.

## Prerequisites
All data was analyzed using R (4.0.0) and RStudio.
