import os

try:
    import requests
except ModuleNotFoundError:
    print("module 'requests' is not installed")
    os.system('pip install requests')

import webbrowser

print("\n\nIf you wish to change the provider and model for the voice, \nterminate the program and edit the provider and model in the script\n\n")

print("NOTE:\nMake a .txt file with the content you wish to convert to speech\nOther file types are not supported!!");

file_path = input("\nEnter file path of the .txt file: ")

def get_file_content():
    if os.path.isfile(file_path):
        file = open(file_path, "r", encoding="utf8")
        content = file.read()
        file.close()
        # View file content
        #print(f"\n{content}\n")
    else:
        print(f"File {file_path} doesn't exist or the path is incorrect")
        content = ""
    return content

text = get_file_content()

# Available providers and models for the voice
# Visit 'Supported Models' Section
# https://docs.edenai.co/reference/audio_text_to_speech_create
provider = 'openai'
model = 'en_echo'

api_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNGEwY2UxZGEtYjQzMC00MTE5LWI3YmEtNzRjNzM2NjM3OTc1IiwidHlwZSI6ImFwaV90b2tlbiJ9.-z3CdQlZwFr6BVwktIvOyRyXucP8_Q636uK56Hg04ks"

url = "https://api.edenai.run/v2/audio/text_to_speech"

payload = {
    "response_as_dict": True,
    "attributes_as_list": False,
    "show_base_64": True,
    "show_original_response": False,
    "rate": 0,
    "pitch": 0,
    "volume": 0,
    "sampling_rate": 0,
    "providers": [f"{provider}/{model}"],
    "text": text
}
headers = {
    "accept": "application/json",
    "content-type": "application/json",
    "authorization": f"Bearer {api_key}"
}

response = requests.post(url, json=payload, headers=headers)

if response.status_code != 200:
    print(f"\nError! \n{response.text}\n")
else:
    print("\nYour download will start soon!\n")
    response_data = response.json()
    result_url = response_data[f"{provider}/{model}"]["audio_resource_url"]
    # View Audio Resource URL
    #print(f"\n{result_url}\n")
    webbrowser.open(result_url)

input("\nEnter any key to exit!\n")

