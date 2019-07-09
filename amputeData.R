# Open mice library
library(mice)

# Open data set
data <- read.csv("/home/paula/testes-pacote/datasets/UCI/Abalone/abalone.csv")

# Ampute data prop 0.15
ampData15 <- ampute(data, prop = 0.15)
write.csv(ampData15$amp, "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone15.csv")

# Ampute data prop 0.40
ampData40 <- ampute(data, prop = 0.4)
write.csv(ampData40$amp, "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone40.csv")

# Ampute data prop 0.65
ampData65 <- ampute(data, prop = 0.65)
write.csv(ampData65$amp, "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone65.csv")