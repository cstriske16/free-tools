import requests
import json

def ip_lookup(ip=""):
    if not ip:
        ip = input("Enter IP address: ")
    
    try:
        # Using ipapi.co API (free)
        response = requests.get(f"http://ipapi.co/{ip}/json/")
        data = response.json()
        
        print("\n" + "="*50)
        print("IP LOOKUP RESULTS")
        print("="*50)
        
        if 'error' in data:
            print("Error: Invalid IP address")
            return
        
        print(f"IP Address: {data.get('ip', 'N/A')}")
        print(f"City: {data.get('city', 'N/A')}")
        print(f"Region: {data.get('region', 'N/A')}")
        print(f"Country: {data.get('country_name', 'N/A')}")
        print(f"ISP: {data.get('org', 'N/A')}")
        print(f"Timezone: {data.get('timezone', 'N/A')}")
        print(f"Coordinates: {data.get('latitude', 'N/A')}, {data.get('longitude', 'N/A')}")
        print(f"Postal Code: {data.get('postal', 'N/A')}")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    print("IP Lookup Tool")
    print("Enter IP address or leave blank for your own IP")
    ip_lookup()
