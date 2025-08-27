# Accepts All Data, returns win percentage (W / (W + L))
get_win_percentage <- function(extracted_data) {
  extracted_data$W / (extracted_data$W + extracted_data$L)
}

# Returns run differential (R - RA)
get_run_differential <- function(extracted_data) {
  extracted_data$R - extracted_data$RA
}

# Returns total plate appearances (AB + BB + HBP + SF)
get_plate_appearances <- function (extracted_data) {
  extracted_data$AB +
    extracted_data$BB +
    extracted_data$HBP +
    extracted_data$SF
}

# Returns batting average (H / AB)
get_batting_average <- function(extracted_data) {
  extracted_data$H / extracted_data$AB
}

# Returns on-base percentage ((H + BB + HBP) / PA)
get_onbase_percentage <- function(extracted_data) {
  (extracted_data$H + extracted_data$BB + extracted_data$HBP) /
    get_plate_appearances(extracted_data)
}

# Returns slugging percentage (TotalBases / AB)
get_slugging_percentage <- function(extracted_data) {
  (
    (extracted_data$H - extracted_data$X2B - extracted_data$X3B - extracted_data$HR) + # nolint
      (2 * extracted_data$X2B) +
      (3 * extracted_data$X3B) +
      (4 * extracted_data$HR)
  ) / extracted_data$AB
}

# Returns OPS (OBP + SLG)
get_ops <- function(extracted_data) {
  get_onbase_percentage(extracted_data) +
    get_slugging_percentage(extracted_data)
}

# Returns stolen base percentage (SB / (SB + CS))
get_stolenbase_percentage <- function(extracted_data) {
  extracted_data$SB / (extracted_data$SB + extracted_data$CS)
}

# Returns strikeout rate (SO / PA)
get_strikeout_rate <- function(extracted_data) {
  extracted_data$SO / get_plate_appearances(extracted_data)
}

# Returns walk percentage (BB / PA)
get_walk_percentage <- function(extracted_data) {
  extracted_data$BB / get_plate_appearances(extracted_data)
}