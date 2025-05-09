import requests
from bs4 import BeautifulSoup
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# LinkedIn credentials (replace with your own)
LINKEDIN_EMAIL = 'your_email@example.com'
LINKEDIN_PASSWORD = 'your_password'

# LinkedIn search URL for Kubernetes-related PDFs
SEARCH_URL = 'https://www.linkedin.com/feed/'

# Folder to save downloaded PDFs
DOWNLOAD_FOLDER = 'Python'
if not os.path.exists(DOWNLOAD_FOLDER):
    os.makedirs(DOWNLOAD_FOLDER)

# Initialize Selenium WebDriver (e.g., Chrome)
driver = webdriver.Chrome()  # Make sure you have ChromeDriver installed

# Function to log in to LinkedIn
def linkedin_login():
    driver.get('https://www.linkedin.com/login')
    time.sleep(2)
    
    # Enter email and password
    email_field = driver.find_element(By.ID, 'username')
    email_field.send_keys(LINKEDIN_EMAIL)
    
    password_field = driver.find_element(By.ID, 'password')
    password_field.send_keys(LINKEDIN_PASSWORD)
    
    # Click the login button
    login_button = driver.find_element(By.XPATH, '//button[@type="submit"]')
    login_button.click()
    time.sleep(3)

# Function to scrape PDF links from the search results
def scrape_pdf_links():
    driver.get(SEARCH_URL)
    time.sleep(5)  # Wait for the page to load
    
    # Parse the page source with BeautifulSoup
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    
    # Find all links (this is a basic example; adjust based on LinkedIn's HTML structure)
    pdf_links = []
    for link in soup.find_all('a', href=True):
        href = link['href']
        if 'pdf' in href.lower():  # Filter for PDF links
            pdf_links.append(href)
    
    return pdf_links

# Function to download a PDF
def download_pdf(url, folder):
    response = requests.get(url)
    if response.status_code == 200:
        file_name = os.path.join(folder, url.split('/')[-1])
        with open(file_name, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {file_name}")
    else:
        print(f"Failed to download: {url}")

# Main script
if __name__ == '__main__':
    try:
        # Log in to LinkedIn
        linkedin_login()
        
        # Scrape PDF links
        pdf_links = scrape_pdf_links()
        print(f"Found {len(pdf_links)} PDF links.")
        
        # Download each PDF
        for link in pdf_links:
            download_pdf(link, DOWNLOAD_FOLDER)
    
    finally:
        # Close the browser
        driver.quit()