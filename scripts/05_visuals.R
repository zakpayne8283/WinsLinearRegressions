library(ggplot2)

# My modules
source("scripts/constants.R")

# Load data from step 4
w_pct_run_diff_linreg <- readRDS(STEP_4_OUTPUT_FILE_RUN_DIFF)
w_pct_so_percent_linreg <- readRDS(STEP_4_OUTPUT_FILE_SO_PERCT)

# Plot Run Differential
plot_to_save <- ggplot(w_pct_run_diff_linreg, aes(x = yearID, y = estimate)) +
  geom_line() +
  labs(
    x = "Year",
    y = "Effect of Run Differential on Win % (slope)",
    title = "Yearly regression slopes: Win% ~ Run Differential"
  ) +
  scale_y_continuous(
    limits = c(0, max(w_pct_run_diff_linreg$estimate, na.rm = TRUE))
  ) +
  geom_smooth(method="lm", se = FALSE, color = "blue")

ggsave(
  PLOT_RUNDIFF_REGRESSION_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)

# Plot SO Rate
plot_to_save <- ggplot(w_pct_so_percent_linreg, aes(x = yearID, y = estimate)) +
  geom_line() +
  labs(
    x = "Year",
    y = "Effect of SO (Batting) % on Win % (slope)",
    title = "Yearly regression slopes: Win% ~ SO (Batting) %"
  ) +
  scale_y_continuous(
    limits = c(
        min(w_pct_so_percent_linreg$estimate, na.rm = TRUE),
        max(w_pct_so_percent_linreg$estimate, na.rm = TRUE))
  ) +
  geom_smooth(method="lm", se = FALSE, color = "blue")

ggsave(
  PLOT_SOPERCT_REGRESSION_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)