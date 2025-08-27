library(ggplot2)
library(ggpmisc)

# My modules
source("scripts/constants.R")

# Load metric'd data from step 3
calculated_team_data <- readRDS(STEP_3_OUTPUT_FILE)

# Load data from step 4
win_pct_run_diff_linreg_yearly <- readRDS(STEP_4_OUTPUT_FILE_RUN_DIFF)
w_pct_so_pct_linreg_yearly <- readRDS(STEP_4_OUTPUT_FILE_SO_PERCT)

# Scatter plot of Differential vs Win %
plot_to_save <-
  ggplot(calculated_data, aes(x = win_percentage, y = run_differential)) +
  geom_point() +
  labs(
    x = "Win Percentage",
    y = "Run Differential",
    title = "Run Differential vs Win Percentage"
  ) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  stat_poly_eq(
    aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
    formula = y ~ x,
    parse = TRUE
  )

# Save the plot
ggsave(
  PLOT_SCATTER_RUNDIFF_WPCT_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)

# Plot Run Differential
plot_to_save <-
  ggplot(win_pct_run_diff_linreg_yearly, aes(x = yearID, y = estimate)) +
  geom_point() +
  labs(
    x = "Year",
    y = "Effect of Run Differential on Win % (slope)",
    title = "Yearly regression slopes: Win% ~ Run Differential"
  ) +
  scale_y_continuous(
    limits = c(0, max(win_pct_run_diff_linreg_yearly$estimate, na.rm = TRUE))
  ) +
  geom_smooth(method="lm", se = FALSE, color = "blue")

# Save the chart
ggsave(
  PLOT_RUNDIFF_REGRESSION_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)

# Scatter plot of SO % vs Win %
plot_to_save <-
  ggplot(calculated_data, aes(x = win_percentage, y = strikeout_rate)) +
  geom_point() +
  labs(
    x = "Win Percentage",
    y = "SO %",
    title = "SO% vs Win Percentage"
  ) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  stat_poly_eq(
    aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
    formula = y ~ x,
    parse = TRUE
  )

# Save the plot
ggsave(
  PLOT_SCATTER_SOPCT_WPCT_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)

# Plot SO Rate
plot_to_save <-
  ggplot(w_pct_so_pct_linreg_yearly, aes(x = yearID, y = estimate)) +
  geom_point() +
  labs(
    x = "Year",
    y = "Effect of SO (Batting) % on Win % (slope)",
    title = "Yearly regression slopes: Win% ~ SO (Batting) %"
  ) +
  scale_y_continuous(
    limits = c(
        min(w_pct_so_pct_linreg_yearly$estimate, na.rm = TRUE),
        max(w_pct_so_pct_linreg_yearly$estimate, na.rm = TRUE))
  ) +
  geom_smooth(method="lm", se = FALSE, color = "blue")

# Save the chart
ggsave(
  PLOT_SOPERCT_REGRESSION_FILE,
  plot = plot_to_save,
  width = 8,
  height = 6,
  dpi = 300
)