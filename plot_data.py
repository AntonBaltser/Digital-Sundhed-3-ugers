import folium
import json
import webbrowser
from pathlib import Path

our_file_path = '/Users/antonbaltser/Desktop/Digital-Sundhed-3-ugers/Individual_history.db'

objekts = []

with open(our_file_path, "r", encoding="utf-8") as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        objekts.append(json.loads(line))

no_data = []
real_data = []
points = []

for data in objekts:
    if "version" in data:
        no_data.append(data)
    else:
        real_data.append(data)

# print(type(real_data))

for data in real_data:
    location = data['value']['Fall info']

    latitude = float(location['Location']['Latitude'])
    longitude = float(location['Location']['Longitude'])

    point = (latitude, longitude)

    points.append(point)

# print(points)

m = folium.Map(location=points[0], zoom_start=14)

for lat, lon in points:
    folium.Marker(
        location=[lat, lon],
        popup=f"Lat: {lat}, Lon: {lon}"
    ).add_to(m)

file_path = Path("map.html").resolve()
m.save("map.html")

webbrowser.open(file_path.as_uri())
