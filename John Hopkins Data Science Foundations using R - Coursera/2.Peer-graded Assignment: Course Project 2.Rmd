# Set the CRAN mirror to use (this one is in the UK, but you can use any)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Now install the package
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)

# Load data
storm <- read.csv("/Users/benjaminbrooke/Desktop/Data/repdata_data_StormData.csv")

# Convert event type to uppercase for consistency
storm$EVTYPE <- toupper(storm$EVTYPE)

# 1. Population health impact (injuries + fatalities)
health_impact <- storm %>%
  group_by(EVTYPE) %>%
  summarize(
    fatalities = sum(FATALITIES, na.rm = TRUE),
    injuries = sum(INJURIES, na.rm = TRUE),
    total_health = fatalities + injuries
  ) %>%
  arrange(desc(total_health)) %>%
  top_n(10, total_health)

# Plot top health-related event types
ggplot(health_impact, aes(x = reorder(EVTYPE, -total_health), y = total_health, fill = EVTYPE)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Top 10 Weather Events by Population Health Impact",
       x = "Event Type", y = "Total Injuries + Fatalities") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 2. Economic impact (property + crop damage)

# Convert exponents to numeric multipliers
convert_exp <- function(exp) {
  exp <- toupper(as.character(exp))
  ifelse(exp == "K", 1e3,
         ifelse(exp == "M", 1e6,
         ifelse(exp == "B", 1e9,
         ifelse(grepl("^[0-9]+$", exp), 10^as.numeric(exp), 1))))
}

storm$PROPDMGEXP <- convert_exp(storm$PROPDMGEXP)
storm$CROPDMGEXP <- convert_exp(storm$CROPDMGEXP)

storm <- storm %>%
  mutate(
    prop_cost = PROPDMG * as.numeric(PROPDMGEXP),
    crop_cost = CROPDMG * as.numeric(CROPDMGEXP),
    total_cost = prop_cost + crop_cost
  )

economic_impact <- storm %>%
  group_by(EVTYPE) %>%
  summarize(total_economic_cost = sum(total_cost, na.rm = TRUE)) %>%
  arrange(desc(total_economic_cost)) %>%
  top_n(10, total_economic_cost)

# Plot top economic-related event types
ggplot(economic_impact, aes(x = reorder(EVTYPE, -total_economic_cost), y = total_economic_cost / 1e9, fill = EVTYPE)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Top 10 Weather Events by Economic Impact",
       x = "Event Type", y = "Total Cost (Billions USD)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))










