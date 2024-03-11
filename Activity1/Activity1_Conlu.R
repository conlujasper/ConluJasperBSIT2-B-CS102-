install.packages("rvest")
install.packages("polite")
library(rvest)
library(polite)
library(dplyr)

# Read the HTML file
headphones_url <- "https://www.amazon.com/s?i=specialty-aps&bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A172541&ref=nav_em__nav_desktop_sa_intl_headphones_0_2_5_8"

session <- bow(headphones_url,
               user_agent = "Educational")
session

session_page <- scrape(session)

div_elements <- html_nodes(session_page,'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')

headphones_bDescriptions<- character()
headphones_prices<-character()
headphones_reviews<-character()
headphones_ratings<-character()

for (div_element in div_elements) {
  
  # Find the span element with class="a-size-base-plus a-color-base a-text-normal" and get the title
  brand_element<- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescription <- ifelse(!is.na(brand_element), html_text(brand_element), '')
  
  # Find the span element with class="a-price-whole" and get the price
  price_element <- html_node(div_element, 'span.a-price-whole')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  # Find the span element with class="a-icon-alt" and get the ratings
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  review_element <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  review <- ifelse(!is.na(review_element), html_text(review_element), '')
  
  # Append data to vectors
  headphones_bDescriptions <- c(headphones_bDescriptions,brandDescription)
  headphones_prices <- c(headphones_prices,price)
  headphones_ratings <- c(headphones_ratings,rating)
  headphones_reviews<-c(headphones_reviews,review)
}


# Create a data frame
product_headphones <- data.frame(
  Category=c('Headphones'), 
  Brands = headphones_bDescriptions, 
  Price = headphones_prices, 
  Rating = headphones_ratings,
  Review=headphones_reviews)


#####
cam_url<- "https://www.amazon.com/s?i=specialty-aps&bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A502394&ref=nav_em__nav_desktop_sa_intl_camera_and_photo_0_2_5_3"

session1 <- bow(cam_url,
                user_agent = "Educational")
session1

session_page1 <- scrape(session1)

div_elements <- html_nodes(session_page1,'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')

cam_brandDescriptions<- character()
cam_prices<-character()
cam_reviews<-character()
cam_ratings<-character()

for (div_element in div_elements) {
  
  # Find the span element with class="a-size-base-plus a-color-base a-text-normal" and get the title
  brand_element<- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescription <- ifelse(!is.na(brand_element), html_text(brand_element), '')
  
  # Find the span element with class="a-price-whole" and get the price
  price_element <- html_node(div_element, 'span.a-price-whole')
  price <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  # Find the span element with class="a-icon-alt" and get the ratings
  rating_element <- html_node(div_element, 'span.a-icon-alt')
  rating <- ifelse(!is.na(rating_element), html_text(rating_element), '')
  
  review_element <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  review <- ifelse(!is.na(review_element), html_text(review_element), '')
  
  # Append data to vectors
  cam_brandDescriptions <- c(cam_brandDescriptions,brandDescription)
  cam_prices <- c(cam_prices,price)
  cam_ratings <- c(cam_ratings,rating)
  cam_reviews<-c(cam_reviews,review)
}


# Create a data frame
cam_product <- data.frame(
  Category=c('Camera'), 
  Brands = cam_brandDescriptions, 
  Price = cam_prices, 
  Rating = cam_ratings,
  Review=cam_reviews)


Activity1_Conlu<-rbind(product_headphones, cam_product)
write.csv(Activity1_Conlu, file = "Activity1_Conlu.csv")




