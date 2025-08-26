# Imports
library(dplyr)
library(Lahman)

# My modules
source("scripts/constants.R")

# Load data from step 1
lin_reg_fields_data_raw <- readRDS(STEP_1_OUTPUT_FILE)

# Filter to only the fields we need
lin_reg_fields_data <- lin_reg_fields_data_raw |>
  select(teamID, lgID, yearID, G, W, L, R, RA, AB, BB, HBP, SF, SO)

# Save the data to another file
saveRDS(lin_reg_fields_data, STEP_2_OUTPUT_FILE)
