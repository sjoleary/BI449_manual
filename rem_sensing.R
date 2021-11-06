
# load libraries
library(tidyverse)
library(janitor)
library(skimr)

library(knitr)

library(rgdal)
library(raster)
library(ggplot2)
library(viridisLite)
library(corrplot)
library(Hmisc)

# set seed
set.seed(42)

## LOAD & FORMAT DATA ----

# # load data sets SOAP
# dtm <- raster("data/NEON_D17_SOAP_DP3_298000_4100000_DTM.tif")
# dsm <- raster("data/NEON_D17_SOAP_DP3_298000_4100000_DSM.tif")
# ndvi <- raster("data/NEON_D17_SOAP_DP3_298000_4100000_NDVI.tif")

# # load data sets SERC
# dtm <- raster("data/NEON_D02_SERC_DP3_366000_4308000_DTM.tif")
# dsm <- raster("data/NEON_D02_SERC_DP3_366000_4308000_DSM.tif")
# ndvi <- raster("data/NEON_D02_SERC_DP3_366000_4308000_NDVI.tif")

# # load data sets DSNY
# dtm <- raster("data/NEON_D03_DSNY_DP3_458000_3113000_DTM.tif")
# dsm <- raster("data/NEON_D03_DSNY_DP3_458000_3113000_DSM.tif")
# ndvi <- raster("data/NEON_D03_DSNY_DP3_458000_3113000_NDVI.tif")

# # load data sets KONZ
# dtm <- raster("data/NEON_D06_KONZ_DP3_702000_4333000_DTM.tif")
# dsm <- raster("data/NEON_D06_KONZ_DP3_702000_4333000_DSM.tif")
# ndvi <- raster("data/NEON_D06_KONZ_DP3_702000_4333000_NDVI.tif")

# # load data sets NOGP
# dtm <- raster("data/NEON_D09_NOGP_DP3_350000_5185000_DTM.tif")
# dsm <- raster("data/NEON_D09_NOGP_DP3_350000_5185000_DSM.tif")
# ndvi <- raster("data/NEON_D09_NOGP_DP3_350000_5185000_NDVI.tif")

# # load data sets MLBS
# dtm <- raster("data/NEON_D07_MLBS_DP3_547000_4141000_DTM.tif")
# dsm <- raster("data/NEON_D07_MLBS_DP3_547000_4141000_DSM.tif")
# ndvi <- raster("data/NEON_D07_MLBS_DP3_547000_4141000_NDVI.tif")

# # load data sets OAES
# dtm <- raster("data/NEON_D11_OAES_DP3_497000_3918000_DTM.tif")
# dsm <- raster("data/NEON_D11_OAES_DP3_497000_3918000_DSM.tif")
# ndvi <- raster("data/NEON_D11_OAES_DP3_497000_3918000_NDVI.tif")

# # load data sets MOAB
# dtm <- raster("data/NEON_D13_MOAB_DP3_641000_4231000_DTM.tif")
# dsm <- raster("data/NEON_D13_MOAB_DP3_641000_4231000_DSM.tif")
# ndvi <- raster("data/NEON_D13_MOAB_DP3_641000_4231000_NDVI.tif")

# load data sets ABBY
dtm <- raster("data/NEON_D16_ABBY_DP3_554000_5068000_DTM.tif")
dsm <- raster("data/NEON_D16_ABBY_DP3_554000_5068000_DSM.tif")
ndvi <- raster("data/NEON_D16_ABBY_DP3_554000_5068000_NDVI.tif")


# calculate slope
slope <- terrain(dtm, opt = "slope", unit = "degrees", neighbors = 8)

# calculate aspect
aspect <- terrain(dtm, opt = "aspect", unit = "radians", neighbors = 8)

# calculate northness
north <- cos(aspect)

# calculate vegetation height
veg_ht <- dsm - dtm

# create raster stack
all_data <- stack(dtm, dsm, slope, north, ndvi, veg_ht)

# rename raster layers
names(all_data) <- c("DTM", "DSM", "slope", "north", "NDVI", "Vegetation.Height")

## PLOT DATA ----

# plot all data sets in raster
plot(all_data, 
     col = viridis(255))


## CREATE DATA FRAME WITH TOPOG & VEG VALUES ----

# create and empty data frame
df <- as.data.frame(matrix(NA, nrow = ncell(dtm), ncol=0))

# extract vegetation height
df$veg_ht <- raster::extract(veg_ht, extent(veg_ht))

# extract ndvi
df$ndvi <- raster::extract(ndvi, extent(ndvi))

# extract dtm
df$dtm  <- raster::extract(dtm, extent(dtm))

# extract slope
df$slope  <- raster::extract(slope, extent(slope))

# extract aspect
df$north <- raster::extract(north, extent(north)) 

# remove NA
df <- df %>%
  filter(!is.na(slope)) %>%
  filter(!is.na(north))

# randomly select 1% of rows
df_sub <- df %>%
  slice_sample(prop = 0.01)

## CALCULATE CORRELATION COEFFICIENTS ----

# calculate pearson's coefficient
P_corr <- rcorr(as.matrix(df), type="pearson")

# create tidy data frame
tidy_cor <- as.data.frame(P_corr$r) %>%
  rownames_to_column("Param1") %>%
  pivot_longer(names_to = "Param2", values_to = "pearson", 2:6) %>%
  filter(Param1 %in% c("veg_ht", "ndvi")) %>%
  filter(!Param2 %in% c("veg_ht", "ndvi")) %>%
  mutate(Site = "ABBY")

# write to file
write_delim(tidy_cor, "results/ABBY_correlation.txt", delim = "\t")

