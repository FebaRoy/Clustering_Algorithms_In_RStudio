# Loading necessary library
library(cluster)

# Reading the dataset
data <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Selecting columns for clustering
selected_data <- data[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Performing agglomerative hierarchical clustering
agg_result <- agnes(selected_data)

# Plotting the dendrogram
plot(agg_result, which.plots = 2)

# Cuting the dendrogram to get clusters
k <- 3 
cluster_cut <- cutree(agg_result, k)

# Adding cluster assignments to the original data
data$Cluster <- cluster_cut

# Plotting the clusters
library(ggplot2)
ggplot(data, aes(x = Age, y = Annual.Income..k.., color = factor(Cluster), size = Spending.Score..1.100.)) +
  geom_point() +
  labs(title = "Agglomerative Clustering for Spending Score", x = "Age", y = "Annual Income (k$)")
