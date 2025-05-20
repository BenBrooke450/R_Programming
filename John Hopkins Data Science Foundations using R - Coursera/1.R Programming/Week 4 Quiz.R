
outcome <- read.csv("/Users/benjaminbrooke/Desktop/Data/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay



best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("/Users/benjaminbrooke/Desktop/Data/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

  ## Define valid outcomes and their corresponding column numbers
  outcome_col <- list(
    "heart attack" = 11,
    "heart failure" = 17,
    "pneumonia" = 23
  )

  ## Check that state is valid
  if (!state %in% data$State) {
    stop("invalid state")
  }

  ## Check that outcome is valid
  if (!outcome %in% names(outcome_col)) {
    stop("invalid outcome")
  }

  ## Get the appropriate column number
  col <- outcome_col[[outcome]]

  ## Filter data for the given state
  state_data <- data[data$State == state, ]

  ## Convert the outcome column to numeric (suppress warnings)
  state_data[, col] <- suppressWarnings(as.numeric(state_data[, col]))

  ## Remove rows with NA in the outcome column
  valid_data <- state_data[!is.na(state_data[, col]), ]

  ## Find the minimum value
  min_val <- min(valid_data[, col], na.rm = TRUE)

  ## Get hospital(s) with the lowest rate (could be multiple)
  best_hospitals <- valid_data[valid_data[, col] == min_val, "Hospital.Name"]

  ## Return the alphabetically first hospital
  return(sort(best_hospitals)[1])
}

best("SC", "heart attack")

best("NY", "pneumonia")

best("AK", "pneumonia")




rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("/Users/benjaminbrooke/Desktop/Data/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

  ## Validate state
  if (!(state %in% data$State)) {
    stop("invalid state")
  }

  ## Define outcome mapping
  outcome_column <- list(
    "heart attack" = 11,
    "heart failure" = 17,
    "pneumonia" = 23
  )

  ## Validate outcome
  if (!(outcome %in% names(outcome_column))) {
    stop("invalid outcome")
  }

  ## Extract relevant columns
  outcome_col_index <- outcome_column[[outcome]]
  data_subset <- data[, c(2, 7, outcome_col_index)]  # Hospital.Name, State, Outcome
  colnames(data_subset) <- c("Hospital", "State", "Rate")

  ## Filter to the given state and remove NAs
  state_data <- subset(data_subset, State == state & !is.na(Rate))
  state_data$Rate <- as.numeric(state_data$Rate)

  ## Order by outcome then hospital name (alphabetical tie-breaker)
  ordered_data <- state_data[order(state_data$Rate, state_data$Hospital), ]

  ## Interpret 'num'
  if (num == "best") {
    return(ordered_data$Hospital[1])
  } else if (num == "worst") {
    return(ordered_data$Hospital[nrow(ordered_data)])
  } else if (is.numeric(num)) {
    if (num > nrow(ordered_data)) {
      return(NA)
    } else {
      return(ordered_data$Hospital[num])
    }
  } else {
    stop("invalid num")
  }
}


rankhospital("NC", "heart attack", "worst")

rankhospital("WA", "heart attack", 7)

rankhospital("TX", "pneumonia", 10)

rankhospital("NY", "heart attack", 7)







rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("/Users/benjaminbrooke/Desktop/Data/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

    ## Check if outcome is valid
    outcome_col <- switch(outcome,
                          "heart attack" = 11,
                          "heart failure" = 17,
                          "pneumonia" = 23,
                          stop("invalid outcome"))

    ## Extract necessary columns
    data_subset <- data[, c(2, 7, outcome_col)]  # Hospital.Name, State, Outcome
    colnames(data_subset) <- c("Hospital", "State", "Rate")
    data_subset$Rate <- as.numeric(data_subset$Rate)

    ## Split data by state
    state_list <- split(data_subset, data_subset$State)

    ## Function to get hospital of given rank in a state
    get_ranked_hospital <- function(df) {
        df <- df[!is.na(df$Rate), ]
        df <- df[order(df$Rate, df$Hospital), ]

        if (num == "best") {
            return(df$Hospital[1])
        } else if (num == "worst") {
            return(df$Hospital[nrow(df)])
        } else if (is.numeric(num) && num <= nrow(df)) {
            return(df$Hospital[num])
        } else {
            return(NA)
        }
    }

    ## Apply to each state
    hospital_names <- sapply(state_list, get_ranked_hospital)

    ## Create result data frame
    result <- data.frame(hospital = hospital_names, state = names(hospital_names))
    rownames(result) <- names(hospital_names)

    return(result)
}

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)


r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)


r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
