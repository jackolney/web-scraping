# Web scraping test
# Aim: scrape from static web pages and then from dynamic pages
# https://www.dataquest.io/blog/web-scraping-tutorial-python/

# Lets start with a static page
url = "https://jackolney.github.io/blog/about/"

import requests

page = requests.get(url)

print(page)
# response [200] means it downloaded successfully

print(page.content)

from bs4 import BeautifulSoup

soup = BeautifulSoup(page.content, "html.parser")

print(soup.prettify())

list(soup.children)

print([type(item) for item in list(soup.children)])

html = list(soup.children)


test = soup.find_all("p")

print(test)

# Why don't I just use R like a sane person
