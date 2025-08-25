# Imports
library(dplyr)
library(Lahman)

# My modules
source("scripts/constants.R")

# Starting year - only do Statcast era for now.
min_year <- 2015

# Just get the data we want to check for creating associations with
# what produces wins for a team
lin_reg_fields_data_raw <- Teams |>
  filter(yearID >= min_year, yearID != 2020)

saveRDS(lin_reg_fields_data_raw, STEP_1_OUTPUT_FILE)