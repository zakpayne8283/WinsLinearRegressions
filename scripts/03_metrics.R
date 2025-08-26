# Imports
library(dplyr)

# My modules
source("scripts/constants.R")

# Load data from step 2
lin_reg_fields_data <- readRDS(STEP_2_OUTPUT_FILE)

# Extrapolate the teams' run diffs and win percents
calculated_lin_reg_data <- lin_reg_fields_data |>
  mutate(
    win_percentage = W / (W + L),
    run_differential = R - RA,
    strikeout_rate = SO / (AB + BB + HBP + SF)
  ) |>
  select(teamID, yearID, lgID, win_percentage, run_differential, strikeout_rate)

saveRDS(calculated_lin_reg_data, STEP_3_OUTPUT_FILE)