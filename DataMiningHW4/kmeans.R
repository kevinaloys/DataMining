# Solution(5)
# Kevin Aloysius
# Reading az-5000.txt data
set.seed(1)
char <- read.table("az-5000.txt", header = TRUE)
# Removing the first Column
char <- char[,2:19]
# Applying kmeans() to calculate the number of clusters
fit <- vector()

for (i in 2:26)
{
  output <- kmeans(char, centers = i, iter.max = 26)
  fit[i] <- (1/i)*sum(kmeans(char, centers = i)$withinss)
}
plot(1:26, fit, type = "b", xlab = "Number of Clusters", ylab = "Goodness of Fit (withinss)",
     main = "Number of Clusters v/s Goodness of Fit")

# Applying kmeans from 15 to 26 to calculate the number of clusters
fit2 <- vector()

for (i in 15:26)
{
  
  fit2[i] <- (1/i)*sum(kmeans(char, centers = i)$withinss)
}
plot(1:26, fit2, type = "b", xlab = "Number of Clusters", ylab = "Goodness of Fit (withinss)",
     main = "Number of Clusters v/s Goodness of Fit")

# The 23rd letter 'W' suggests the number of natural clusters. This is because
# after plotting the number of K's from 15 to 26, we could observe a dip at 23 suggesting
# the number of clusters.