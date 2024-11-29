#pipe install requests
#pip install beautifulsoup


import requests
from bs4 import BeautifulSoup

def new_headlines(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')

    headlines = soup.find_all('h2')
    
    for idx, hd in enumerate(headlines, 1):
        print(f'{idx}:{hd.text.strip()}')


new_headlines('https://www.indiatoday.in/')
