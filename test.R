# I can't do this in python, lets just use R

#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scrapped
url <- 'https://jackolney.github.io/blog/about/'

#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrap the rankings section
rank_data_html <- html_nodes(webpage,'p')

#Converting the ranking data to text
rank_data <- html_text(rank_data_html)

#Let's have a look at the rankings
head(rank_data)

#Data-Preprocessing: Converting rankings to numerical
rank_data<- as.character(rank_data)

#Let's have another look at the rankings
head(rank_data)


# Dynamic content
require(RSelenium)

library(stringr)

url <- "http://www.inc.com/"

search <- "trump"

url <- paste(url,"search?q=",search,sep = "")

checkForServer()

startServer(invisible = TRUE)

# New way of accessing RSelenium, this needs exploring further
RSelenium::rsDriver()

remDr <- remoteDriver()

# Open the browser webpage

remDr$open()
