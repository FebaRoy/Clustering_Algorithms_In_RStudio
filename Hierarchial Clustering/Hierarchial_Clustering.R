# Loading necessary packages
library(cluster)

# Reading the dataset
data <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Removing any rows with missing values
df <- na.omit(df)

# Selecting columns for clustering
selected_data <- df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Calculating pairwise dissimilarity using Euclidean distance
dist_matrix <- dist(selected_data)

# Performing hierarchical clustering
hc <- hclust(dist_matrix)

# Ploting the dendrogram
plot(hc, main = "Hierarchical Clustering Dendrogram")

# Creating a scatter plot
library(ggplot2)
ggplot(df, aes(x = Annual.Income..k.., y = Spending.Score..1.100., color = factor(Cluster))) +
  geom_point() +
  labs(title = "Hierarchical Clustering",
       x = "Annual Income (k$)",
       y = "Spending Score (1-100)")
