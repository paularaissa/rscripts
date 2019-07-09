#setwd("/home/paula/testes-pacote/datasets")
dataset <- read.csv("/home/paula/testes-pacote/datasets/UCI/Abalone/abalone.csv")


##################### METHOD 1 ###############################################
sets <- split(dataset, rep(1:3, length.out = nrow(dataset), each = ceiling(nrow(dataset)/3)))
write.csv(sets[1], "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone_1of3.csv")
write.csv(sets[2], "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone_2of3.csv")
write.csv(sets[3], "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone_3of3.csv")

##################### METHOD 2 ###############################################

## 75% of the sample size
smp_size <- floor(0.60 * nrow(dataset))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(dataset)), size = smp_size)

train <- dataset[train_ind, ]
test <- dataset[-train_ind, ]

# Do it if you need to transform numeric to categorical data
#train$sex[train$sex == 3] <- 'M' 
#test$sex[test$sex == 3] <- 'M' 
#train$sex[train$sex == 2] <- 'I' 
#test$sex[test$sex == 2] <- 'I' 
#train$sex[train$sex == 1] <- 'F' 
#test$sex[test$sex == 1] <- 'F'

test[is.na(test)] <- ''
train[is.na(train)] <- ''

write.csv(train, "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone65_1of2.csv")
write.csv(test, "/home/paula/testes-pacote/datasets/UCI/Abalone/abalone65_2of2.csv")
