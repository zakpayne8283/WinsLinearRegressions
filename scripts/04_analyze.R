# Imports
library(broom)
library(dplyr)
library(purrr)
library(stats)

# My modules
source("scripts/constants.R")

# =========
# FUNCTIONS
# =========

# Creates a dataframe of all correlations in predictors vs win %
create_correlation_dataframe <- function(predictors, calculated_data) {
  # A list of all predictors, and their r2 values against win %
  correlations <- map_dfr(predictors, function(pred) {
    model <- lm(
                as.formula(paste("win_percentage ~", pred)),
                data = calculated_data)
    tibble(
      predictor = pred,
      r.squared = round(summary(model)$r.squared, 3)
    )
  })

  correlations <- correlations |>
    arrange(desc(r.squared)) # nolint
}

# Get the data from Step 03
calculated_data <- readRDS(STEP_3_OUTPUT_FILE)

overall_predictors <- c(
  "R",
  "RA",
  "run_differential"
)
overall_correlations <- create_correlation_dataframe(
  predictors = overall_predictors,
  calculated_data = calculated_data
)

offense_predictors <- c(
  "R",
  "H",
  "X2B",
  "X3B",
  "HR",
  "batting_average",
  "strikeout_rate",
  "walk_percentage"
)
offense_correlations <- create_correlation_dataframe(
  predictors = offense_predictors,
  calculated_data = calculated_data
)

defensive_predictors <- c(
  "RA"
)
defense_correlations <- create_correlation_dataframe(
  predictors = defensive_predictors,
  calculated_data = calculated_data
)

# Save to a file
saveRDS(overall_correlations, STEP_4_OUTPUT_FILE_OVERALL_CORRELATIONS)
saveRDS(offense_correlations, STEP_4_OUTPUT_FILE_OFFENSE_CORRELATIONS)
saveRDS(defense_correlations, STEP_4_OUTPUT_FILE_DEFENSE_CORRELATIONS)
