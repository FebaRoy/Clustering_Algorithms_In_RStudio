# Loading necessary packages for K-Medoids clustering
install.packages("cluster")
library(cluster)

# Loading the dataset
df <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Removing any rows with missing values
df <- na.omit(df)

# Selecting columns for clustering
selected_data <- df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Performing K-Medoids clustering assuming K = 3
k <- 3
medoid_res <- pam(selected_data, k, metric = "euclidean", stand = FALSE)

# Adding cluster assignments to the original dataset
df$Cluster <- medoid_res$clustering

# Printing the cluster assignments
print(df)

# Visualizing the clusters
library(factoextra)
fviz_cluster(medoid_res, data = selected_data, geom = "point", frame.type = "norm")
