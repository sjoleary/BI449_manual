
library(tidyr)
library(hockeystick)

# retrieve NOAA/ESRL Mauna Loa 
# https://gml.noaa.gov/ccgg/trends/data.html
carbon <- get_carbon()
write_delim(carbon, "data/CO2_monthly.txt", delim = "\t")


# retrieve annual global CO2 emissions from Global Carbon Project/Our World in Data repository
# https://github.com/owid/co2-data

url <- "https://github.com/owid/co2-data/raw/master/owid-co2-data.csv"
dl <- tempfile()
download.file(url, dl)
emissions <- suppressMessages( read_csv(dl,  col_types = cols(other_industry_co2 = col_skip(), other_co2_per_capita = col_skip())) )

write_delim(emissions, "data/emissions.txt", delim = "\t")


# sea level coastal tide gauge records 1880 - 2013 (Commonwealth Scientific and Industrial Research Organisation)
# NOAA Laboratory for Satellite Altimetry

sealevel <- get_sealevel()

write_delim(sealevel, "data/sealevel.txt", delim = "\t")


# Arctic or Antarctic annual Sea Ice Index (in million square km).
# National Snow and Ice Data Center, Arctic (Northern Hemisphere) July sea ice extent.
# https://nsidc.org/data/seaice_index/archives 

ice_arctic <- get_seaice(pole = "N")
write_delim(ice_arctic, "data/arctic_ice.txt", delim = "\t")

ice_antarctic <- get_seaice(pole = "S")
write_delim(ice_antarctic, "data/antarctic_ice.txt", delim = "\t")


# NOAA Hurricane Research Division HURDAT2 hurricane data
# ACE is accumulated cyclone energy
hurricane <- get_hurricanes()

write_delim(hurricane, "data/hurricanes.txt", delim = "\t")

