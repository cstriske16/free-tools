import requests
import time

url = input("Webhook: ")
msg = input("Message: ")
num = int(input("How many: "))

success_count = 0
fail_count = 0

print(f"\nSending {num} messages...\n")

for i in range(num):
    try:
        response = requests.post(url, json={"content": msg})
        
        if response.status_code == 204:
            print(f"Sent {i+1}/{num} - Success")
            success_count += 1
        else:
            print(f"Sent {i+1}/{num} - Failed (Status: {response.status_code})")
            fail_count += 1
            
    except Exception as e:
        print(f"Sent {i+1}/{num} - Error: {str(e)}")
        fail_count += 1
    
    time.sleep(1)

print(f"\nResults:")
print(f"Successful: {success_count}")
print(f"Failed: {fail_count}")
print(f"📨 Total sent: {success_count + fail_count}")
