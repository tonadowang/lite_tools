#!/usr/bin/python
import requests, json, datetime, os

global url
url = "https://sort.veritas.com/kernel/get_kern_data"

def get_website_contents(url):
    data=str()
    if not isinstance(url, str) and 'ttp' not in url:
        raise Exception(
            f"input {url} invalid!"
        )
    r = requests.get(url)
    if r:
        if r.status_code != 200:
            raise Exception(
                f"input {url} not reachable, response code {r.status_code}!"
            )
        else:
            data = r.text
    return data

def write_info_to_file(input_content):
    today = datetime.datetime.now()
    file_name = "get_data_" + str( today.strftime("%Y-%m-%d") ) + ".txt"
    if os.path.isfile(file_name):
        os.rename(
            file_name,
            file_name+".bak"
            )
    text_file = open(file_name, "w")
    text_file.write(input_content)
    text_file.close()
    print(f"{file_name} write succeed in current path")

def compare_file():
    pass

def main():
    data = get_website_contents(url)
    write_info_to_file(data)
    print(f"{url} data save succeed")


if __name__ == '__main__':
    main()