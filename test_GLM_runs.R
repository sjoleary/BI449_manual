
# load libraries
library(GLMr)
library(glmtools)
library(tidyverse)



## Scenario: Extreme windstorm in the month of September that last a week ----

# set sim folder
sim_folder <- "sim_clim-scenarios/extreme_windstorm"

# define file path
nml_file <- file.path(sim_folder, "glm2.nml")

# read nml file
nml <- read_nml(nml_file)

# check met file name
get_nml_value(nml, "meteo_fl")

# plot drivers (met file)
plot_meteo(nml_file)

# check simulation run
run_glm(sim_folder, verbose = TRUE)


## Scenario: Extreme rainstorm in the Dec 16-17 ----

# set sim folder
sim_folder <- "sim_clim-scenarios/extreme_rainstorm"

# define file path
nml_file <- file.path(sim_folder, "glm2.nml")

# read nml file
nml <- read_nml(nml_file)

# check met file name
get_nml_value(nml, "meteo_fl")

# plot drivers (met file)
plot_meteo(nml_file)

# check simulation run
run_glm(sim_folder, verbose = TRUE)

## Scenario: Temp increas + 2 humidity decreas minus 2 ----

# set sim folder
sim_folder <- "sim_clim-scenarios/gradual_tempinc_humdec"

# define file path
nml_file <- file.path(sim_folder, "glm2.nml")


# read in altered met file & convert time format for GLM
metadata <- read_delim(file.path(sim_folder, "met_hourly_temp2_hum2.csv"), delim = ",") %>%
  mutate(time = as.POSIXct(strptime(time, "%Y-%m-%d %H:%M:%S", tz="EST")))
         
# write back to file
write_delim(metadata, file.path(sim_folder, "met_hourly_temp2_hum2.csv"), delim = ",")
         

# read nml file
nml <- read_nml(nml_file)

# check met file name
get_nml_value(nml, "meteo_fl")

# plot drivers (met file)
plot_meteo(nml_file)

# check simulation run
run_glm(sim_folder, verbose = TRUE)









