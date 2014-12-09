# Hierarchial Clustering
# Kevin Aloysius
set.seed(123)

# Loading the data
character <- read.table("az-5000.txt", header = TRUE)

# Removing the first column
char <- character[,-1]

# Applying kmeans
fit <- vector()
for (i in 2:26)
{
  output <- kmeans(char, centers = i, iter.max = 26)
  
}

# Hierarchial Clustering
fit <- hclust(a <- dist(output$centers, method = "euclidean"), method="average")
plot(fit)

# 26x26 Matrix Mapping, Letters vs Cluster numbers

letter_matrixrix <- character[,1]
num_cluster <- output$cluster 
matrix <- matrix(0,26,26)
rownames(matrix) <- LETTERS

for(k in 1:5000)
{ 
  matrix[letter_matrix[k], num_cluster[k]] <-  matrix[letter_matrix[k], num_cluster[k]] + 1
}

# Replacing Values of Dendograms with Letters
common <- c()
for(i in 1:26)
{
  common[i] <- which.max(matrix[,i])
}

plot(fit, labels=LETTERS[common])