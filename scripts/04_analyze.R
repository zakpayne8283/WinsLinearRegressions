# Imports
library(broom)
library(dplyr)
library(stats)

# My modules
source("scripts/constants.R")

# Get the data from Step 03
calculated_data <- readRDS(STEP_3_OUTPUT_FILE)

# Run a linear regression on Run Diff / Win %
win_pct_run_diff_linreg_yearly <- calculated_data |>
  # Group by each year, then
  group_by(yearID) |>
  # Loop each year, doing a linear regression
  do(
    tidy(lm(win_percentage ~ run_differential, data = .))
  ) |>
  # Format the data for a chart showing the relation
  # between year and impact of Run Diffs on win percetnage
  filter(term == "run_differential") |>
  select(yearID, estimate)

# Run a linear regression on SO % / Win %
w_pct_so_pct_linreg_yearly <- calculated_data |>
  # For each year,
  group_by(yearID) |>
  # Do a linear regression to get the values for that year
  do(
    tidy(lm(win_percentage ~ strikeout_rate, data = .))
  ) |>
  # Just filter out and select the data we need
  filter(term == "strikeout_rate") |>
  select(yearID, estimate)

# Save to a file
saveRDS(win_pct_run_diff_linreg_yearly, STEP_4_OUTPUT_FILE_RUN_DIFF)
saveRDS(w_pct_so_pct_linreg_yearly, STEP_4_OUTPUT_FILE_SO_PERCT)
