library(rvest)
library(httr)
library(dplyr) 
library(polite)
library(stringr)
library(ggplot2)
library(readr)
polite::use_manners(save_as = 'polite_scrape.R')





session <- bow(url = 'https://www.imdb.com/title/tt7286456/reviews/?ref_=tt_ov_rt', user_agent = "Educational")

session

session_scrape <- scrape(session)

J_reviews <- function(page_url) {
  
  page <- read_html(page_url)
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  J_df= data.frame(
    Movie_Name=c('Joker'),
    Reviewer_Name = names[1:25],
    Content_Review = content_reviews[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Reviews = reviews[1:25]
  )
}

Joker_urls<-c('https://www.imdb.com/title/tt7286456/reviews/?ref_=tt_ov_rt',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4xojermtizcsyab7gthhnjyr3rmscb334ptt6xqcwb32v3anyqkqdc2mjoiowpydsvm4fi7sco74xhznfze2',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4u6dermtizcsyql7svxtnbwrhummbjy2indd7xqcwb32v3dnuqk6cc3mjoe6wgcaa5rotrhloieackcmln4a',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4v6jermtizcsyqe72th7nzsr7q4oab23ukd34hqcwb32w3cneqk4dc4mjojn436emy2qykz2dpia2cnnllvo',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4s6rermtizcsyqg7kxxhmbzr3qmwaj23indd7hqcwb32v3anywkkdstmjoe4ftogfnfuqqj4fmi5jhloxp7q',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6hcbsqyxdo6ih7svxfmzyqlq4uabz3uodb7xndpj3qflemawkybksourtbfril4q2kokts6qinqoycoiynhi',
              'https://www.imdb.com/title/tt3915174/reviews/_ajax?&paginationKey=g4w6lbjsqyxdo6ih7suxvmzyr7t4ucby3ektt6xldpj3qflhnyr2kcc2oertbvbpq7drbsislm2eayc5wxkuqdi',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6ncbsqyxdo6ih7wth5mjtr7rmubr53qndb6hedpj3qflenmt26dczoirtbyw4mavzbuzm6heuv4gkcye7say',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4w6rbjsqyxdo6ih7wuhvnzwqpumwbbt3akdr77jdpj3qfleniw2ud27o4rtb5xnfbaz3qpcwf2yqz3iczovdoa',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xohcbsqyxdo6ih7wvxhmzsrdqmubb334nt74ppdpj3qflenqrkscc2oertbiu7vtbhl7yf7vwjcamq6eezq2i',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xolbjsqyxdo6ih7wwxhobvrhrm6bzy3qotr6pjdpj3qflenawkqbk2oartax3qkeddfun23ascdzugufa4s3q',
              'https://www.imdb.com/title/tt17351924/reviews/_ajax?&paginationKey=g4xoncbsqyxdo6ih7wxxxmbqr3umuar234ktb6pfdpj3qfleniqkkdszpertbnlp2ec2caasbomrlicogvlmr6y'
)

Joker_reviews <- lapply(Joker_urls, J_reviews)
Joker_Review <- do.call(rbind, Joker_reviews)
View(Joker_Review)

