library(DBI)
library(dplyr)
connection<-dbConnect(RMariaDB::MariaDB(),
                      dsn="RMaria-connection",
                      dbname="sample_dbjas",
                      Server="localhost",
                      user="root")

#Checking the connect
dbListTables(connection)
dbListFields(connection,"posts")
postsDataScience <- dbGetQuery(connection, "SELECT * FROM sample_dbjas.posts")

save(papers, file = "arxiv_science_database.RData")
write.csv(papers, file = "arxiv_science_database.csv")