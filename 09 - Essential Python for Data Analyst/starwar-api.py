
from requests import get
from time import sleep
import csv

### request data

url = "https://swapi.dev/api/people/"
data = []

for i in range(20):
  index = i + 1
  new_url = url + str(index)
  resp = get(new_url).json()

  try:
    name = resp["name"]
    height = resp["height"]

    if resp["gender"] == "n/a":
      gender = "unknown"
    else:
      gender = resp["gender"]

    homeworld =  resp["homeworld"]

    if resp["species"] == []:
      species = "https://swapi.dev/api/species/1/"
    else:
      species = resp["species"][0]

    data.append({"name": name, "height": height, "gender": gender, "homeworld": homeworld, "species": species})
  except:
    pass

  sleep(1)

### preview data
for person in data:
  print(person)

### write csv

fields = ['name', 'height', 'gender', 'homeworld', 'species']
 
# name of csv file
filename = "starwar-data.csv"
 
# writing to csv file
with open(filename, 'w') as csvfile:
    # creating a csv dict writer object
    writer = csv.DictWriter(csvfile, fieldnames=fields)
 
    # writing headers (field names)
    writer.writeheader()
 
    # writing data rows
    writer.writerows(data)



