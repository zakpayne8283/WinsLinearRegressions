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
    batting_average = H / AB,
    strikeout_rate = SO / (AB + BB+ HBP + SF), # TODO: Rename this to so_pecentage # nolint
    walk_percentage = BB / (AB + BB + HBP + SF)
  ) |>
  select(
    yearID,
    lgID,
    teamID,
    R,
    H,
    X2B,
    X3B,
    HR,
    RA,
    win_percentage,
    run_differential,
    batting_average,
    strikeout_rate,
    walk_percentage
  )

saveRDS(calculated_team_data, STEP_3_OUTPUT_FILE)