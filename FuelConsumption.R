library(ggplot2)

set.seed(123)

n <- 150

weight <- runif(n, min = 15, max = 60)      # tons
speed <- runif(n, min = 20, max = 65)       # mph
distance <- runif(n, min = 20, max = 200)   # miles

b0 <- 12.5
b1 <- 3.1
b2 <- -0.8
b3 <- 0.45

fuel <- b0 + b1 * weight + b2 * speed + b3 * distance + rnorm(n, mean = 0, sd = 8)

convoy <- data.frame(
  weight = weight,
  speed = speed,
  distance = distance,
  fuel = fuel
)

#Scatterplots with regression lines

# Weight vs fuel
plot_weight_fuel <- ggplot(convoy, aes(x = weight, y = fuel)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Vehicle weight vs fuel consumed",
    x = "Vehicle weight (tons)",
    y = "Fuel consumed (gallons)"
  )

# Speed vs fuel
plot_speed_fuel <- ggplot(convoy, aes(x = speed, y = fuel)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Average speed vs fuel consumed",
    x = "Average speed (mph)",
    y = "Fuel consumed (gallons)"
  )

# Distance vs fuel
plot_distance_fuel <- ggplot(convoy, aes(x = distance, y = fuel)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Distance traveled vs fuel consumed",
    x = "Distance traveled (miles)",
    y = "Fuel consumed (gallons)"
  )

#Print the plots
plot_weight_fuel
plot_speed_fuel
plot_distance_fuel
