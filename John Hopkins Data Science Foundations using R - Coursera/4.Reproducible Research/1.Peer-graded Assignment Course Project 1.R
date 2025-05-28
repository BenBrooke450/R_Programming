# Set the CRAN mirror to use (this one is in the UK, but you can use any)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Now install the package
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

# 1. Load and process the data
activity <- read.csv("/Users/benjaminbrooke/Desktop/Data/activity.csv")
activity$date <- as.Date(activity$date)

# 2. Histogram of total number of steps taken per day
total_steps <- activity %>%
  group_by(date) %>%
  summarize(total = sum(steps, na.rm = TRUE))

ggplot(total_steps, aes(x = total)) +
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Total Steps per Day", x = "Steps", y = "Frequency")

# 3. Mean and median of total steps per day
mean_steps <- mean(total_steps$total)
median_steps <- median(total_steps$total)

cat("Mean:", mean_steps, "\n")
cat("Median:", median_steps, "\n")

# 4. Time series of average steps per interval
avg_interval <- activity %>%
  group_by(interval) %>%
  summarize(avg_steps = mean(steps, na.rm = TRUE))

ggplot(avg_interval, aes(x = interval, y = avg_steps)) +
  geom_line(color = "blue") +
  labs(title = "Average Steps per 5-Minute Interval", x = "Interval", y = "Average Steps")

# 5. Interval with the maximum average steps
max_interval <- avg_interval[which.max(avg_interval$avg_steps), ]

cat("Interval with max avg steps:", max_interval$interval, "\n")

# 6. Impute missing values
missing_count <- sum(is.na(activity$steps))
cat("Missing step values:", missing_count, "\n")

# Replace NA with average for that interval
activity_imputed <- activity
for (i in 1:nrow(activity_imputed)) {
  if (is.na(activity_imputed$steps[i])) {
    interval_val <- activity_imputed$interval[i]
    activity_imputed$steps[i] <- avg_interval$avg_steps[avg_interval$interval == interval_val]
  }
}

# Recalculate totals
total_steps_imputed <- activity_imputed %>%
  group_by(date) %>%
  summarize(total = sum(steps))

ggplot(total_steps_imputed, aes(x = total)) +
  geom_histogram(binwidth = 1000, fill = "green", color = "black") +
  labs(title = "Total Steps per Day (Imputed)", x = "Steps", y = "Frequency")

# Mean and median after imputation
mean_steps_imputed <- mean(total_steps_imputed$total)
median_steps_imputed <- median(total_steps_imputed$total)

cat("Imputed Mean:", mean_steps_imputed, "\n")
cat("Imputed Median:", median_steps_imputed, "\n")

# 7. Weekday vs weekend activity pattern
activity_imputed$day_type <- ifelse(weekdays(activity_imputed$date) %in% c("Saturday", "Sunday"), "weekend", "weekday")

avg_by_day_type <- activity_imputed %>%
  group_by(interval, day_type) %>%
  summarize(avg_steps = mean(steps))

ggplot(avg_by_day_type, aes(x = interval, y = avg_steps, color = day_type)) +
  geom_line() +
  facet_wrap(~day_type, ncol = 1) +
  labs(title = "Weekday vs Weekend Activity", x = "Interval", y = "Average Steps")
