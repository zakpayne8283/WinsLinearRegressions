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
    plate_appearances = (AB + BB + HBP + SF),
    batting_average = H / AB,
    onbase_percentage = (H + BB + HBP) / plate_appearances,
    slugging_percentage = (
      ((H - X2B - X3B - HR) + (2 * X2B) + (3 * X3B) + (4 * HR)) / AB
    ),
    ops = onbase_percentage + slugging_percentage,
    stolenbase_percentage = SB / (SB + CS),
    strikeout_rate = SO / plate_appearances, # TODO: Rename this to so_pecentage # nolint
    walk_percentage = BB / plate_appearances
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
    SB,
    CS,
    BB,
    SO,
    RA,
    win_percentage,
    run_differential,
    batting_average,
    onbase_percentage,
    slugging_percentage,
    ops,
    stolenbase_percentage,
    strikeout_rate,
    walk_percentage
  )

saveRDS(calculated_team_data, STEP_3_OUTPUT_FILE)