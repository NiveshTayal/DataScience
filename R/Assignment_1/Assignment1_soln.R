##############################Analytics with R-Assignment 1########################################
#1.	How to get a description of the version of R and its attached packages used in the current session?
sessionInfo()

#2.	Create object called “abc” by assigning the number 3.
abc<-3
abc

#3.	Create different vectors (“a” is numeric, “b” is character and “c” is logical).
a<-c(1,2,3)
b<-c('a','b','c')
c<-c(TRUE,FALSE)
class(a)
class(b)
class(c)

#4.	List all the objects in the current session.
ls()

#5.	Create vector “x” with the values {4, 4, 5, 6, 7, 2, 9}.
#a.	Calculate the number of observation (n), mean, sum, max, min, variance  of the vector ‘x”.
#b.	Also print the 3rd element, odd positions elements and elements from 2 to  6 positions.
x<-c(4,4,5,6,7,2,9)
length(x)
mean(x)
sum(x)
max(x)
min(x)
var(x)

x[3]
x[c(1,3,5,7)]
x[2:6]

#6.	Create 6x4 matrix(6 rows and 4 columns) using 1 to 24 numbers.
matrix(c(1:24), nrow = 6,ncol = 4,byrow = TRUE)

#7.	Create data frame with the below vectors

#a.   StoreID - (111, 208, 113, 408)
#b.   Tenure  - (25, 34, 28, 52)
#c.	StoreType  - ("Type1", "Type2", "Type1", "Type1")
#d.	status  - ("Poor", "Improved", "Excellent", "Poor")

data<-data.frame(
  StoreID = c (111,208,113,408), 
  Tenure = c (25, 34, 28, 52), 
  StoreType = c("Type1", "Type2", "Type1", "Type1"),
  status = c("Poor", "Improved", "Excellent", "Poor")
)
data

#8.	Print the data in different programs.

#a.	only storeId, tenure
#b.	only storetype and status
#c.	only tenure

library(dplyr)
data %>%
  select(StoreID,Tenure)
data %>%
  select(StoreType,status)
data$Tenure

#9.	Create different factors using the below vectors and label the values and order the levels for factors “outcome” and “status”.
#a.	ethnicity - White", "African amrican", "White", "Asian"
#b.	status - Poor", "Improved", "Excellent", "Poor"
#c.	outcome - c(1, 3, 2, 4, 3, 1, 1) – labels- “Poor", "Average", "Good", "Excellent"
ethincity<-factor(c("White", "African amrican", "White", "Asian"))
status <- factor(c("Poor", "Improved", "Excellent", "Poor"),levels=c("Poor", "Improved", "Excellent"),ordered=TRUE)
outcome <-factor(c(1, 3, 2, 4, 3, 1, 1),levels=c(1,2,3,4),ordered=TRUE)

#10.	Create list called “mylist” with the title "My First List" and with the below objects called “ages” with below h, j and k. Also print the different combinations of objects.
#a.	h –numeric vector with the values 25, 26, 18, 39
#b.	j – matrix with 5 rows and 2 columns with the values 1 to 10
#c.	k – character vector with the values "one", "two", "three"
mylist<-list(h=c(25,26,18,39), j=matrix(c(1:10),5,2), k=c("one","two","three"))
mylist

#11.	Read the stores.csv data set and find the summary statistics for all the columns.
getwd()
setwd('C:/Users/v-nitaya/Desktop/Python/Office Assignments')
data1<-read.csv('stores.csv')
summary(data1)

#12.	Use with() function, calculate the summary of operatingcost in the stores.csv data set. What is the difference?
obj<-with(data1, data1$OperatingCost)
summary(obj)

#13.	Apply below functions on stores data frame and observe the outputs.
#a.	class(stores)
#b.	names(stores)
#c.	length(stores)
#d.	dim(stores)
#e.	str(stores)
#f.	head(stores)
#g.	tail(stores)
#h.	fix(stores)
class(data1)
names(data1)
length(data1)
dim(data1)
str(data1)
head(data1)
tail(data1)
fix(data1)

#14.	Create new variable by OperatingCost + AcqCostPercust using different methods
#a.	Simple calculation and assignment operators
#b.	Using transform function
data1$Total_cost<-data1$OperatingCost+data1$AcqCostPercust
data1$Total_cost

data2 <- transform(data1, Total_cost1 = AcqCostPercust + OperatingCost)
data2$Total_cost1

#15.	Create new variable store class as follows.
#a.	If total sales<120 then “Low Perform store”
#b.	If total sales>=120 and total sales<240 then “Average Perform store”
#c.	If total sales>240  then “High Perform store”
data1$class[data1$TotalSales<120]<-"Low"
data1$class[data1$TotalSales>=120 & data1$TotalSales<240]<-"Average"
data1$class[data1$TotalSales>240]<-"High"
data1$class

#16.	Rename the variable “AcqCostPercust”  with “AcqCost”
names(data1)[names(data1) == 'AcqCostPercust'] <- 'AcqCost'
names(data1)
