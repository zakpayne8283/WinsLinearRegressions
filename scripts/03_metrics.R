# Imports
library(dplyr)

# My modules
source("scripts/constants.R")

# Load data from step 2
extracted_team_data <- readRDS(STEP_2_OUTPUT_FILE)

# Extrapolate the teams' run diffs and win percents
calculated_team_data <- extracted_team_data |>
  mutate(
    win_percentage = W / (W + L),
    run_differential = R - RA,
    strikeout_rate = SO / (AB + BB + HBP + SF) # TODO: Rename this to so_pecentage # nolint 
  ) |>
  select(teamID, yearID, lgID, win_percentage, run_differential, strikeout_rate)

saveRDS(calculated_team_data, STEP_3_OUTPUT_FILE)