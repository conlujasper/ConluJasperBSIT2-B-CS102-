library(odbc)
library(RMariaDB)
library(DBI)
library(dplyr)
connection<-dbConnect(RMariaDB::MariaDB(),
                      dsn="RMaria-connection",
                      dbname="sample_dbjas",
                      Server="localhost",
                      user="root")


dbListTables(connection)
dbListFields(connection,"movies_reviews")

#1
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('The Meg 2', 'jprizzotto', '03/09/2021','9/10', 'not as bad as people says', 'Good and intense movie,some guys thinks this is a copy of the classic Steven Spielberg Movie Jaw well, still not one of the best intense movies of warner bros.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)

#2.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review) VALUES('The Meg 2', 'priyankcs', '10/08/2018','2/10', ' Bad movie', 'The Meg was joke .Director need to decide whether it is comedy or action movie.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)


#3.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review) VALUES('Spiderman', 'johnpmoseley', '23/11/2023','3/10', ' As pretty and structurally unsound as a crumbling country pile','I feel like this is one of those movies you either love or hate. Honestly, all the hype around it on social media got me interested.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)

#4.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Puss N Boots', 'brian-91770', '03/09/2021','1/10', 'Nope not for me', 'I was not going to review this but with all the positive reviews I feel like I have to be the voice of reason here.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)


#5.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Dune', 'Johnny_West', '24/10/2021','1/10', 'Long Winded Scenes, Slow Boring Pace', 'About an hour of back story that really made no sense. The Atreades are on their own planet, so they take about a thousand troops to the spice planet to mine for spice, at the request of the Emperor. ')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)

#6.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Interstellar', 'zardoz-13', '25/11/2014','10/10', ' A Sci-Fi Masterpiece', 'Hollywood science fiction spectacles about antagonistic aliens abandoning dying worlds to occupy not only Earth, but also to oust us have been popular with moviegoers.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)


#7.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Interstellar', 'Rainey-Dawn', '15/11/2020','10/10', 'Fascinating Film', 'The earth is plagued with droughts, famines and other apocalyptic disasters. Mankind must find a way to leave planet earth once and for all. An earth-like planet has been discovered in another solar system. A spaceship can travel fast through a wormhole though interstellar space but can Cooper get there and return to earth in time to see his daughter before she grows too old. The Aging of Murph vs her father Cooper the answer is relativity playing a factor in aging  how fast time runs depend on the relative position of the observer and the subject.Incredible movie HIGHLY RECOMMENDED.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)

#8.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('The Dark Knight', 'AlsExGal', '02/10/2017','8/10', ' Perfect balance between action and drama with an unforgettable villain
', 'Although I dont think it is the fourth best movie ever made, as it is rated according to IMDb, I do think it stands head and shoulders above its superhero peers, mainly because it is NOT a superhero movie. Batman is a mere mortal with lots of time to train himself physically and money to design the nifty gadgets he uses.Everybody on earth has seen this film, so no use regurgitating the plot. ')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)


#9.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Game of Thrones', 'shreyashukla1', '25/03/2020','7/10', 'Its over at S6', 'Daenerys leaves for Westeros and you assume the rest.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)


#10.
query<-"INSERT INTO movies_reviews(title, reviewer, date_of_review, rating, title_review, review)VALUES('Joker', 'brianmlucas', '05/10/2019','9/10', ' Not a spoon feeding of CGI fueled faux drama.' , 'The movie affects you in a way that makes it physically painful to experience, but in a good way.')"

query_result <- dbSendQuery(connection, query)
review_moviews_data <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.movies_reviews")
glimpse(review_moviews_data)

View(review_moviews_data)


write.csv(review_moviews_data,file="LAB_Activity4_Conlu.csv")

dbDisconnect(connection)
