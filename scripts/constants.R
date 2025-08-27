# Data Files

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
# Year-by-year linear regression of Run Differential on Win %
STEP_4_OUTPUT_FILE_RUN_DIFF <- "outputs/data/04_win_pct_run_diff_linreg_yearly.rds" # nolint
# Year-by-year linear regression of SO % (Batting) on Win %
STEP_4_OUTPUT_FILE_SO_PERCT <- "outputs/data/04_w_pct_so_pct_linreg_yearly.rds" # nolint

PLOT_RUNDIFF_REGRESSION_FILE <- "outputs/plots/run_diff_regression_yearly.png" # nolint
PLOT_SOPERCT_REGRESSION_FILE <- "outputs/plots/so_prct_regression_yearly.png" # nolint