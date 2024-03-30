# Loading necessary packages for CLARA Clustering
install.packages("cluster")
library(cluster)

# Reading the dataset
df <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Removing any rows with missing values
df <- na.omit(df)

# Selecting columns for clustering
selected_data <- df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")]

# Performing CLARA clustering assuming K=3
k <- 3
clara_res <- clara(selected_data, k, pamLike = TRUE)

# Adding cluster assignments to the original dataset
df$Cluster <- clara_res$clustering

# Printing the cluster assignments
print(df)

# Visualizing the clusters
library(factoextra)
fviz_cluster(clara_res, data = selected_data, geom = "point", frame.type = "norm")
