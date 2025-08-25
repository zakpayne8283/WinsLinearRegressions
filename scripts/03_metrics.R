# Imports
library(dplyr)

# My modules
source("scripts/constants.R")

# Load data from step 2
lin_reg_fields_data <- readRDS(STEP_2_OUTPUT_FILE)

# Extrapolate the teams' run diffs and win percents
team_rundiff_winpct <- lin_reg_fields_data |>
  mutate(
    win_percentage = W / (W + L),
    run_differential = R - RA
  ) |>
  select(teamID, yearID, lgID, win_percentage, run_differential)

saveRDS(team_rundiff_winpct, STEP_3_OUTPUT_FILE)