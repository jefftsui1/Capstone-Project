# This mini-project is based on the K-Means exercise from 'R in Action'
# Go here for the original blog post and solutions
# http://www.r-bloggers.com/k-means-clustering-from-r-in-action/

# Exercise 0: Install these packages if you don't have them already

# install.packages(c("cluster", "rattle.data","NbClust"))
install.packages(c("cluster", "rattle.data","NbClust"))

# Now load the data and look at the first few rows
data(wine, package="rattle.data")
head(wine)

# Exercise 1: Remove the first column from the data and scale
# it using the scale() function
wine1 <- scale(wine[-1])


# Now we'd like to cluster the data using K-Means. 
# How do we decide how many clusters to use if you don't know that already?
# We'll try two methods.

# Method 1: A plot of the total within-groups sums of squares against the 
# number of clusters in a K-means solution can be helpful. A bend in the 
# graph can suggest the appropriate number of clusters. 

wssplot <- function(data, nc=15, seed=1234){
	              wss <- (nrow(data)-1)*sum(apply(data,2,var))
               	      for (i in 2:nc){
		        set.seed(seed)
	                wss[i] <- sum(kmeans(data, centers=i)$withinss)}
	                
		      plot(1:nc, wss, type="b", xlab="Number of Clusters",
	                        ylab="Within groups sum of squares")
	   }

wssplot(wine1)

# Exercise 2:
#   * How many clusters does this method suggest?

##After the third clusters, there is a significant drop of "Within groups sum of squares" vs  "Number of Clusters".

#   * Why does this method work? What's the intuition behind it?
##A selected number of clusters are required for the Kmeans before the algorithm is run. The method observes the possible 
##number of clusters and minimizes the cluster sum of the squares. 

#   * Look at the code for wssplot() and figure out how it works
#wssplot <- function(data, nc=15, seed=1234){ 
##Created a function, loaded dataframe within, set the number of clusters to be 15, place a random seed of 1234.
#wss <- (nrow(data)-1)*sum(apply(data,2,var))
##Set the number of row in the dataframe minus one then multiply the sum of variance in each columns.
#for (i in 2:nc){
##Created a for loop by looping index i, cannot have 1 cluster after 2.
#set.seed(seed)
##set the seed 
#wss[i] <- sum(kmeans(data, centers=i)$withinss)}
##Calculated the sum of vectors within the cluster sum of squares for clusters of 2 to 15.

# Method 2: Use the NbClust library, which runs many experiments
# and gives a distribution of potential number of clusters.

library(NbClust)
set.seed(1234)
nc <- NbClust(wine1, min.nc=2, max.nc=15, method="kmeans")
barplot(table(nc$Best.n[1,]),
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")


# Exercise 3: How many clusters does this method suggest?
#Three cluster is suggested by this method.

# Exercise 4: Once you've picked the number of clusters, run k-means 
# using this number of clusters. Output the result of calling kmeans()
# into a variable fit.km

# fit.km <- kmeans( ... )
fit.km <- kmeans(wine1, centers = 3)

# Now we want to evaluate how well this clustering does.

# Exercise 5: using the table() function, show how the clusters in fit.km$clusters
# compares to the actual wine types in wine$Type. Would you consider this a good
# clustering?

table(fit.km$cluster, wine$Type)
#It's a good clustering because 59 + 65 + 48 / 59 + 65 + 48 + 3 + 3.  172/178 = 0.9663

# Exercise 6:
# * Visualize these clusters using  function clusplot() from the cluster library
# * Would you consider this a good clustering?

#clusplot( ... )
library(cluster)
clusplot(wine1, fit.km$cluster)
#Yes, it would be consider a good clustering.