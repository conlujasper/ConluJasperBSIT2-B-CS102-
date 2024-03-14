library(readxl)



movies_3k<-read.csv('C:/Users/Vijay Magarzo/Documents/Jasper/Data cleaning/Movie_Reviews_3000.csv')

library(dplyr)

#checking NULL values
View(movies_3k)
str(movies_3k)

movie3k<-as_tibble(movies_3k)
movie3k

#LOWERCASE ALL THE CHARACTERS
movie3k$Movie_Name<-tolower(movie3k$Movie_Name)
movie3k

movie3k$Reviewer_Name<-tolower(movie3k$Reviewer_Name)
movie3k

movie3k$Content_Review<-tolower(movie3k$Content_Review)
movie3k

movie3k$Reviews<-tolower(movie3k$Reviews)
movie3k

#CONVERTING THE DATE
#install.packages("lubridate")

library(lubridate)

movie3k$Date

movie3k$Date<-dmy(movie3k$Date)

as.POSIXct.Date(movie3k$Date,format="%d-%m-%Y")

View(movie3k)

#CONVERTING THE DATE and its AVERAGE
movie3k$User_Rating<-as.numeric(gsub("/.*", "", movie3k$User_Rating))

movie3k$User_Rating<-ifelse(is.na(movie3k$User_Rating), mean(movie3k$User_Rating, na.rm=TRUE))
View(movie3k)
                           
#Creating a dataframe
cleaned_movies3k <- data.frame(
                             Name=movie3k$Movie_Name,
                             Reviewer=movie3k$Reviewer_Name,
                             Date=movie3k$Date,
                             Rating=movie3k$User_Rating,
                             Content=movie3k$Content_Review,
                             Review=movie3k$Reviews
                          )
                           
write.csv(cleaned_movies3k, file = "Lab5_cleanedMovieData_Conlu.csv")
                           
