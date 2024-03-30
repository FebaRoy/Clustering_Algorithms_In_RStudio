# Loading necessary packages for Fuzzy C-Means
install.packages("e1071")
library(e1071)

# Reading your CSV data
df <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Removing any rows with missing values
df <- na.omit(df)

# Selecting columns for clustering
selected_data <- df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Performing Fuzzy C-Means clustering taking K as 3
k <- 3
fcm_res <- cmeans(selected_data, centers = k, iter.max = 100, dist = "euclidean", m = 2)

# Adding cluster assignments to the original dataset
df$Cluster <- max.col(fcm_res$membership)

# Printing the cluster assignments
print(df)

# Creating a scatter plot for visualization
library(ggplot2)
ggplot(df, aes(x = Annual.Income..k.., y = Spending.Score..1.100., color = factor(Cluster))) +
  geom_point() +
  labs(title = "Fuzzy C-Means Clustering",
       x = "Annual Income (k$)",
       y = "Spending Score (1-100)")
