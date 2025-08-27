# Imports
library(broom)
library(dplyr)
library(purrr)
library(stats)

# My modules
source("scripts/constants.R")

# Get the data from Step 03
calculated_data <- readRDS(STEP_3_OUTPUT_FILE)

# All of the predictors that might be looked at
predictors <- c(
  "R",
  "H",
  "X2B",
  "X3B",
  "HR",
  "RA",
  "run_differential",
  "batting_average",
  "strikeout_rate",
  "walk_percentage"
)

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
  arrange(desc(r.squared))

# Save to a file
saveRDS(correlations, STEP_4_OUTPUT_FILE_CORRELATIONS)
