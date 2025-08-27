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
STEP_4_OUTPUT_FILE_OVERALL_CORRELATIONS <- "outputs/data/04_overall_correlations.rds" # nolint
STEP_4_OUTPUT_FILE_OFFENSE_CORRELATIONS <- "outputs/data/04_offense_correlations.rds" # nolint
STEP_4_OUTPUT_FILE_DEFENSE_CORRELATIONS <- "outputs/data/04_defense_correlations.rds" # nolint

# =====
# PLOTS
# =====

PLOT_SCATTER_R_WPCT_FILE <- "outputs/plots/r_wpct_scatter.png" # nolint
PLOT_SCATTER_H_WPCT_FILE <- "outputs/plots/h_wpct_scatter.png" # nolint
PLOT_SCATTER_X2B_WPCT_FILE <- "outputs/plots/x2b_wpct_scatter.png" # nolint
PLOT_SCATTER_X3B_WPCT_FILE <- "outputs/plots/x3b_wpct_scatter.png" # nolint
PLOT_SCATTER_HR_WPCT_FILE <- "outputs/plots/hr_wpct_scatter.png" # nolint
PLOT_SCATTER_SB_WPCT_FILE <- "outputs/plots/sb_wpct_scatter.png" # nolint
PLOT_SCATTER_CS_WPCT_FILE <- "outputs/plots/cs_wpct_scatter.png" # nolint
PLOT_SCATTER_RA_WPCT_FILE <- "outputs/plots/ra_wpct_scatter.png" # nolint
PLOT_SCATTER_RUNDIFF_WPCT_FILE <- "outputs/plots/run_diff_wpct_scatter.png" # nolint
PLOT_SCATTER_BAVG_WPCT_FILE <- "outputs/plots/batting_average_wpct_scatter.png" # nolint
PLOT_SCATTER_OBP_WPCT_FILE <- "outputs/plots/onbase_percentage_wpct_scatter.png" # nolint
PLOT_SCATTER_SLG_WPCT_FILE <- "outputs/plots/slugging_percentage_wpct_scatter.png" # nolint
PLOT_SCATTER_OPS_WPCT_FILE <- "outputs/plots/ops_wpct_scatter.png" # nolint
PLOT_SCATTER_SOPCT_WPCT_FILE <- "outputs/plots/sopct_wpct_scatter.png" # nolint
PLOT_SCATTER_BBPCT_WPCT_FILE <- "outputs/plots/bbpct_wpct_scatter.png" # nolint

# ======
# TABLES
# ======

TABLE_OVERALL_CORRELATIONS_FILE <- "outputs/tables/overall_correlations.png" # nolint
TABLE_OFFENSE_CORRELATIONS_FILE <- "outputs/tables/offense_correlations.png" # nolint
TABLE_DEFENSE_CORRELATIONS_FILE <- "outputs/tables/defense_correlations.png" # nolint