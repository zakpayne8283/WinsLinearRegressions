library(ggplot2)
library(ggpmisc)
library(gridExtra)

# My modules
source("scripts/constants.R")

# =========
# FUNCTIONS
# =========

# Generates a scatterplot for the provided data
generate_scatterplot <- function(source_data, x_axis, y_axis, x_axis_title, y_axis_title, chart_title, file_name) { # nolint
  plot_to_save <-
    ggplot(source_data, aes(x = {{x_axis}}, y = {{y_axis}})) +
    geom_point() +
    labs(
      x = x_axis_title,
      y = y_axis_title,
      title = chart_title
    ) +
    geom_smooth(method = "lm", se = FALSE, color = "blue") +
    stat_poly_eq(
      aes(label = paste(..rr.label.., sep = "~~~")), # nolint
      formula = y ~ x,
      parse = TRUE
    )

  # Save the plot
  ggsave(
    file_name,
    plot = plot_to_save,
    width = 8,
    height = 6,
    dpi = 500
  )
}

generate_data_table <- function(source_data, file_name) {
  # New Image
  png(file_name, width = 800, height = 600)

  # Draw the table
  grid.table(source_data)

  # Close the device
  dev.off()
}

# Load metric'd data from step 3
calculated_team_data <- readRDS(STEP_3_OUTPUT_FILE)

# Load data from step 4
correlations <- readRDS(STEP_4_OUTPUT_FILE_CORRELATIONS)

# Generate a table of the correlations
generate_data_table(correlations, TABLE_CORRELATIONS_FILE)

# Scatter plot of Runs vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = R,
  x_axis_title = "Win Percentage",
  y_axis_title = "Runs Scored",
  chart_title = "Runs Scored vs. Win Percentage",
  PLOT_SCATTER_R_WPCT_FILE
)

# Scatter plot of Hits vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = H,
  x_axis_title = "Win Percentage",
  y_axis_title = "Hits",
  chart_title = "Team Hits vs. Win Percentage",
  PLOT_SCATTER_H_WPCT_FILE
)

# Scatter plot of Doubles vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = X2B,
  x_axis_title = "Win Percentage",
  y_axis_title = "Doubles",
  chart_title = "Team Doubles vs. Win Percentage",
  PLOT_SCATTER_X2B_WPCT_FILE
)

# Scatter plot of Triples vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = X3B,
  x_axis_title = "Win Percentage",
  y_axis_title = "Triples",
  chart_title = "Team Triples vs. Win Percentage",
  PLOT_SCATTER_X3B_WPCT_FILE
)

# Scatter plot of HRs vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = HR,
  x_axis_title = "Win Percentage",
  y_axis_title = "Home Runs",
  chart_title = "Team Home Runs vs. Win Percentage",
  PLOT_SCATTER_HR_WPCT_FILE
)

# Scatter plot of Runs Against vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = RA,
  x_axis_title = "Win Percentage",
  y_axis_title = "Runs Against",
  chart_title = "Runs Against vs. Win Percentage",
  PLOT_SCATTER_RA_WPCT_FILE
)

# Scatter plot of Differential vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = run_differential,
  x_axis_title = "Win Percentage",
  y_axis_title = "Run Differntial",
  "Run Differential vs. Win Percentage",
  PLOT_SCATTER_RUNDIFF_WPCT_FILE
)

# Scatter plot of Team Batting Average vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = batting_average,
  x_axis_title = "Win Percentage",
  y_axis_title = "Batting Average",
  chart_title = "Team Batting Average vs. Win Percentage",
  PLOT_SCATTER_BAVG_WPCT_FILE
)

# Scatter plot of SO % vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = strikeout_rate,
  x_axis_title = "Win Percentage",
  y_axis_title = "SO %",
  chart_title = "SO % vs. Win Percentage",
  PLOT_SCATTER_SOPCT_WPCT_FILE
)

# Scatter plot of BB % vs Win %
generate_scatterplot(
  source_data = calculated_data,
  x_axis = win_percentage,
  y_axis = walk_percentage,
  x_axis_title = "Win Percentage",
  y_axis_title = "BB %",
  chart_title = "BB % vs. Win Percentage",
  PLOT_SCATTER_BBPCT_WPCT_FILE
)