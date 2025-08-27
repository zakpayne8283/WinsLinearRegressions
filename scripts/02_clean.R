# Imports
library(dplyr)
library(Lahman)

# My modules
source("scripts/constants.R")

# Load data from step 1
team_data_raw <- readRDS(STEP_1_OUTPUT_FILE)

names(team_data_raw)

# Filter to only the fields we need
extracted_team_data <- team_data_raw |>
  select(
    yearID,
    lgID,
    teamID,
    G,
    W,
    L,
    R,
    AB,
    H,
    X2B,
    X3B,
    HR,
    BB,
    HBP,
    SF,
    SO,
    RA
  )

# Save the data to another file
saveRDS(extracted_team_data, STEP_2_OUTPUT_FILE)
