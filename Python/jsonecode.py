import requests
import json
from tabulate import tabulate

def fetch_and_display_json_table():
    url = "https://app7-a9fucccqdua6h4bb.centralindia-01.azurewebsites.net/customerInfo"
    
    try:
        # 1. Fetch the data with timeout and headers
        headers = {'Accept': 'application/json'}
        response = requests.get(url, headers=headers, timeout=10)
        
        # 2. Check if response is valid
        response.raise_for_status()  # Raises HTTPError for bad responses
        
        # 3. Debug raw response
        print(f"Raw response (first 200 chars): {response.text[:200]}")  # Debugging
        
        # 4. Try parsing JSON
        try:
            data = response.json()
        except json.JSONDecodeError:
            print("Error: Response is not valid JSON")
            print(f"Response content: {response.text}")
            return
        
        # 5. Handle different response formats
        records = data.get('recordset', data) if isinstance(data, dict) else data
        
        if not records:
            print("No data available in response")
            return
        
        # 6. Display table
        print("\nCustomer Data:")
        print(tabulate(records, headers='keys', tablefmt='grid'))
        
    except requests.exceptions.RequestException as e:
        print(f"Request failed: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")

if __name__ == "__main__":
    fetch_and_display_json_table()