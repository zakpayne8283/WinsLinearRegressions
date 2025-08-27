# ==========
# Data Files
# ==========

# STEP 01
# Raw Lahman::Batting output
STEP_1_OUTPUT_FILE <- "outputs/data/01_team_data_raw.rds" # nolint

# STEP 02
# Extracted fields needed for analysis
STEP_2_OUTPUT_FILE <- "outputs/data/02_extracted_team_data.rds" # nolint

# STEP 03
# Calculated fields (+needed fields) for analysis
# e.g. Win%, SO%, etc.
STEP_3_OUTPUT_FILE <- "outputs/data/03_calculated_team_data.rds" # nolint

# STEP 04
# Data analyzed, ready for plotting
# All correlations we've calculated
STEP_4_OUTPUT_FILE_CORRELATIONS <- "outputs/data/04_all_correlations.rds" # nolint

# =====
# Plots
# =====
PLOT_SCATTER_R_WPCT_FILE <- "outputs/plots/r_wpct_scatter.png" # nolint
PLOT_SCATTER_RA_WPCT_FILE <- "outputs/plots/ra_wpct_scatter.png" # nolint
PLOT_SCATTER_RUNDIFF_WPCT_FILE <- "outputs/plots/run_diff_wpct_scatter.png" # nolint
PLOT_SCATTER_SOPCT_WPCT_FILE <- "outputs/plots/sopct_wpct_scatter.png" # nolint
PLOT_SCATTER_SOPCT_WPCT_FILE <- "outputs/plots/bbpct_wpct_scatter.png" # nolint
TABLE_CORRELATIONS_FILE <- "outputs/tables/correlations.png" # nolint