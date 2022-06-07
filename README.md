# MicroPouch

## DNA extraction
### Linking of barcodes
Every sample has been transfered to a DNA lysis tube, which has been connected to the barcode of the sample. The first script `barcode_link.RMD` extracts the relevant information from the linking files and checks if it is in the barcode sheet provided from the hospital. Furthermore, the script visualizes the extraction plates generated. In the end a file called `/data/barcodes_sheet/csv/ext_link.csv` is created which contains all this information.

### Adding extraction concentrations
`extraction_conc.Rmd` will add the measured DNA extraction and library concentration to the `ext_link.csv` in a file called `/data/EXT_conc/EXT_ALL.csv`. Extraction failed for most of EXT00003 because of human error (C6 and Top Elute was switched around in QIAcube). This `Rmd` will find the samples for which extraction failed for re-extraction.

### Redo Libraries
Not all metagenomes turned out good. For some plates many samples failed even though the extraction concentration was good. `redo_libraries.Rmd` creates a file with the bad libraries (108) in total which were redone in LIB00007 and LIB00008. Second part of the `Rmd` corrects the `EXT_ALL.csv` file with the new libraries in a file called `/data/metagenomes_lab/metagenome_libraries.csv`.

The script also visualizes the plates before and after correction.

## Metadata
The `MicroPouch_metadata.Rmd` ...

