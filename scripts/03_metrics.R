# Imports
library(dplyr)

# My modules
source("helpers/metrics.R")
source("scripts/constants.R")

# Load data from step 2
extracted_team_data <- readRDS(STEP_2_OUTPUT_FILE)

export_fields <- c("yearID", "lgID", "teamID", "R", "H", "X2B", "X3B",
                   "HR", "SB", "CS", "BB", "SO", "RA", "win_percentage",
                   "run_differential", "batting_average", "onbase_percentage",
                   "slugging_percentage", "ops", "stolenbase_percentage",
                   "strikeout_rate", "walk_percentage")

# Extrapolate the teams' run diffs and win percents
calculated_team_data <- extracted_team_data |>
  mutate(
    win_percentage = get_win_percentage(extracted_team_data),
    run_differential = get_run_differential(extracted_team_data),
    plate_appearances = get_plate_appearances(extracted_team_data),
    batting_average = get_batting_average(extracted_team_data),
    onbase_percentage = get_onbase_percentage(extracted_team_data),
    slugging_percentage = get_slugging_percentage(extracted_team_data),
    ops = get_ops(extracted_team_data),
    stolenbase_percentage = get_stolenbase_percentage(extracted_team_data),
    strikeout_rate = get_strikeout_rate(extracted_team_data), # TODO: Rename this to so_pecentage # nolint
    walk_percentage = get_walk_percentage(extracted_team_data)
  ) |>
  select(all_of(export_fields))

saveRDS(calculated_team_data, STEP_3_OUTPUT_FILE)