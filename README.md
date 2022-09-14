# MicroPouch and MicroPouch NP


## Abstract
### MicroPouch

### MicroPouch NP


## Microbiome Analysis
This repository contains the code used for generating the microbiome analysis of two project: MicroPouch and MicroPouch NP. There is a tag in the scripts called `project_filter`, which takes one of two values `MP` or `NP`. This value determines which samples are analyzed.

### Heatmaps
`src/heatmaps.Rmd` will produce the heatmaps. Set the `project_filter` and follow the headlines as some chunks are specific for producing the plots to either `MP` or `NP`.

### Alpha/beta diversity
`src/alpha-beta_diversity.Rmd` will produce the alpha and beta diversity plots.

Richness was defined as species with a relative abundance >0 and alpha diversity was calculated using the Shannon diversity index. Patient sample similarity to donors were calculated using both Sørensen coefficient on relative abundances and Bray-Curtis on Hellinger transformed relative abundances. In the `MP` project the similarity would be measured as the median similarity to donor samples received and also as median similarity to a donor sample from each donor not received. For the placebo group similarity was calculated as the median similarity to a donor sample from each donor used in the FMT group.

For the NP project only the donor samples the patient received were used for similarity measurement.


### Ordination
`src/ordinationplot.Rmd` produces the ordination plots. The Rmarkdown file has two sections - one for `MP` and one for `NP`.



