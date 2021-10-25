
import requests
import json

murl = 'http://169.254.169.254/latest/'

def print_metadata():
    first = ["meta-data/"]
    result = expand_metafields(murl, first)
    metadata_json = json.dumps(result, indent=4, sort_keys=True)

def expand_metafields(url, z):
    output = {}
    for item in z:
        new_url = url + item
        r = requests.get(new_url)
        txt = r.text
        print (txt) #test
        if item[-1] == "/":
            list_of_values = txt.split('/') #split in array


print(print_metadata())