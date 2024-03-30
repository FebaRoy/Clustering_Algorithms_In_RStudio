# Load necessary packages for K means clustering
install.packages("factoextra")
install.packages("cluster")
library(factoextra)
library(cluster)

# Loading the dataset
df <- read.csv("C:\\Users\\ASUS\\OneDrive\\Documents\\Semester 8\\Data Mining Techniques\\Assignments\\R Studio\\Mall_Customers.csv", header = TRUE)

# Removing any rows with missing values
df <- na.omit(df)

# Scaling each variable to have a Mean= 0 and Standard Deviation=1
df_scaled <- scale(df[, c("Age", "Annual.Income..k..", "Spending.Score..1.100.")])

# Performing k-means clustering assuming K = 3
k <- 3
km_res <- kmeans(df_scaled, centers = k, nstart = 25)

# Adding cluster assignments to the original dataset
df$Cluster <- km_res$cluster

# Printing the cluster assignments
print(df)

# Visualizing the clusters
fviz_cluster(km_res, data = df_scaled, geom = "point", frame.type = "norm")
