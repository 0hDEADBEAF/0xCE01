import requests as r
import sys
import os

ytb_music_server_port = os.environ["YTB_MUSIC_PORT"]
base_url = f"http://localhost:{ytb_music_server_port}/"
api_url = f"{base_url}api/v1/"
bearer_token = r.post(base_url + "auth/http").json()["accessToken"]
headers = {
        "accept": "*/*",
        "Authorization": f"Bearer {bearer_token}"
    }

def dispatch_command(command: str) -> None:
    response = r.post(api_url + command, headers=headers)

if __name__ == "__main__":
   dispatch_command(sys.argv[1])
