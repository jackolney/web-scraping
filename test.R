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

####################################################################################################
# Lets start again
# https://cran.r-project.org/web/packages/RSelenium/vignettes/RSelenium-basics.html
# https://cran.r-project.org/web/packages/RSelenium/RSelenium.pdf

require(RSelenium)

# set up server
rD <- rsDriver(verbose = TRUE, port = 4571L)

# set up driver
remDr <- rD$client

# Tell RSelenium to go to a site
remDr$navigate("https://forwardkeys.com/")

# Basic controls
remDr$getTitle()
remDr$goBack()
remDr$goForward()

# 'arg' should be one of "xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"
loginWindow <- remDr$findElement(using = "class", value = "login")
loginWindow$clickElement()

# email
input_email <- remDr$findElement(using = "name", value = "email")
input_email$sendKeysToElement(list("jack@olney.co.uk"))

# password
input_password <- remDr$findElement(using = "name", value = "password")
input_password$sendKeysToElement(list("password"))

# click the login button
login_button <- remDr$findElement(using = "id", value = "login_button")
login_button$clickElement()

# Okay, now we can get past the login window... next step
