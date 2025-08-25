library(broom)
library(dplyr)
library(Lahman)
library(stats)

# Load data from step 1
lin_reg_fields_data_raw <- readRDS("outputs/data/01_lin_reg_fields_data_raw")

# Filter to only the fields we need
lin_reg_fields_data <- lin_reg_fields_data_raw |>
  select(teamID, lgID, yearID, G, W, L, R, RA)

# Save the data to another file
saveRDS(lin_reg_fields_data, "outputs/data/02_lin_reg_fields_data")
