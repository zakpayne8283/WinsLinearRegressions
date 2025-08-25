library(ggplot2)

# My modules
source("scripts/constants.R")

# Load data from step 4
w_pct_run_diff_linreg <- readRDS(STEP_4_OUTPUT_FILE)

# Plot it
ggplot(w_pct_run_diff_linreg, aes(x = yearID, y = estimate)) +
  geom_line() +
  geom_point() +
  labs(
    x = "Year",
    y = "Effect of Run Differential on Win % (slope)",
    title = "Yearly regression slopes: Win% ~ Run Differential"
  ) +
  scale_y_continuous(
    limits = c(0, max(w_pct_run_diff_linreg$estimate, na.rm = TRUE))
  )
