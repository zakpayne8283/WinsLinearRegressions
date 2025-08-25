# Imports
library(broom)
library(dplyr)
library(stats)

# My modules
source("scripts/constants.R")

# Get the data from Step 03
team_rundiff_winpct <- readRDS(STEP_3_OUTPUT_FILE)

# Run a linear regression on it
w_pct_run_diff_linreg <- team_rundiff_winpct |>
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

# Save to a file
saveRDS(w_pct_run_diff_linreg, STEP_4_OUTPUT_FILE)
