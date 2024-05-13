# MicroPouch

## Abstract
Objective: To investigate if treatment with non-pooled multi-donor faecal microbiota transplantation (FMT) for four weeks was superior to placebo for inducing clinical remission in patients with chronic pouchitis. 
Design: The study was a randomised placebo-controlled study with a 4-week intervention period and 12 months follow-up. Eligible patients with chronic pouchitis were recruited from five Danish hospitals. Patients were randomised to treatment with non-pooled multi-donor FMT derived from four faecal donors, or placebo. The study treatment was delivered by enema daily for two weeks followed by every second day for two weeks. Disease severity was accessed before and after treatment at 30-day follow-up, using the Pouchitis Disease Activity Index (PDAI). A PDAI <7 was considered equivalent to clinical remission. The gut microbiota in faecal samples from patients and donors was analysed using shotgun metagenomic sequencing.
Results: 30 patients were included and randomised 1:1 to treatment with FMT or placebo. There was no difference in patients achieving clinical remission between the two groups at 30-day follow-up RR 1.0 (95% CI (0.55;1.81)). The mean difference for PDAI at 30-day follow-up decreased significantly for both groups, with a decrease of 1.83 (95% CI (0.33;3.34)) for the FMT group and 2.57 (95% CI (1.13;4.02)) for the placebo group, but no absolute difference was observed between groups (0.40, 95% CI (-1.62;2.43)). FMT treatment increased the similarity of the patient faecal microbiome to the faecal donor microbiome, which was not seen after placebo treatment.
Conclusion: Non-pooled multi-donor FMT was equal to placebo for inducing clinical remission in patients with chronic pouchitis. 

### Background and Aims
To investigate if treatment with non-pooled multi-donor faecal microbiota transplantation (FMT) for four weeks was superior to placebo to induce clinical remission in patients with chronic pouchitis.

### Methods
The study was a randomised double-blinded placebo-controlled study with a 4-week intervention period and 12-month follow-up. Eligible patients with chronic pouchitis were recruited from five Danish hospitals. Participants were randomised to non-pooled multi-donor FMT derived from four faecal donors, or placebo. Treatment was delivered daily by enema for two weeks followed by every second day for two weeks. Disease severity was accessed at inclusion and 30-day follow-up, using the Pouchitis Disease Activity Index (PDAI); PDAI <7 was considered equivalent to clinical remission. Faecal samples from participants and donors were analysed by shotgun metagenomic sequencing.

### Results
Inclusion was stopped after inclusion of 30 participants who were randomised 1:1 for treatment with FMT or placebo. There was no difference in participants achieving clinical remission between the two groups at 30-day follow-up, relative risk 1.0 (95%CI(0.55;1.81)). Treatment with FMT resulted in a clinically relevant increase in adverse events compared to placebo, incidence rate ratio 1.67 (95%CI(1.10;2.52)); no serious adverse events within either group. Faecal microbiota transplantation statistically significantly increased the similarity of participant faecal microbiome to the faecal donor microbiome at 30-days follow-up (p=0.01), which was not seen after placebo.

### Conclusions
Non-pooled multi-donor FMT was comparable to placebo in inducing clinical remission in patients with chronic pouchitis but showed a clinically relevant increase in adverse events compared to placebo.

## Cite

> Sabrina Just Kousgaard, Frederik Cold, Sofie Ingdam Halkjær, Andreas Munk Petersen, Jens Kjeldsen, Jane Møller Hansen, Sebastian Mølvang Dall, Mads Albertsen, Hans Linde Nielsen, Karina Frahm Kirk, Kirsten Duch, Mads Sønderkær, Ole Thorlacius-Ussing, The effect of non-pooled multi-donor faecal microbiota transplantation for inducing clinical remission in patients with chronic pouchitis: Results from a multicentre randomised double-blinded placebo-controlled trial (MicroPouch), Journal of Crohn's and Colitis, 2024;, jjae066, https://doi.org/10.1093/ecco-jcc/jjae066

## Microbiome Analysis

This repository contains the code used for generating the microbiome analysis. All scripts for code generation can be found in `src` folder.

An external library is needed, which can be installed as:

`remotes::install_github("SebastianDall/mplibrary")`

Scripts are:
- `src/heatmaps.Rmd`: Produces heatmaps of the relative abundance of the top most abundant species.
- `src/alpha-beta_diversity.Rmd`: Produces alpha and beta diversity plots.
- `src/ordinationplot.Rmd`: Produces ordination plots.

Richness was defined as species with a relative abundance >0 and alpha diversity was calculated using the Shannon diversity index. Patient sample similarity to donors were calculated using both Sørensen coefficient on relative abundances and Bray-Curtis on Hellinger transformed relative abundances. The similarity would be measured as the median similarity to donor samples received and also as median similarity to a donor sample from each donor not received. For the placebo group, similarity was calculated as the median similarity to a donor sample from each donor used in the FMT group.


## Prerequisites
All data was analyzed using R (4.0.0) and RStudio.

## Data
Sequencing data is available at [PRJEB66493](https://www.ebi.ac.uk/ena/browser/view/PRJEB66493). To rerun the workflow install snakemake and run the snakemake pipeline as:

```bash
snakemake -s _pipelines/metaphlan4/Snakemake --use-conda --cores <cores>
```

You will have to manually download the data from the ENA and modify the dataframe in `files/samples/sample_barcode.txt` to match the downloaded data. Placing the data into `data/illumina` then it should match.

