#!/usr/bin/env python3
import requests
from datetime import datetime

def get_forecast_url(latitude, longitude):
    response = requests.get(f"https://api.weather.gov/points/{latitude},{longitude}")
    if response.status_code == 200:
        return response.json()["properties"]["forecastHourly"]
    return None

SFO_lat = "37.7875"
SFO_long = "-122.3905"

url = get_forecast_url(SFO_lat, SFO_long)

if url:
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        currentDateTime = datetime.now().replace(tzinfo=None)

        for period in data["properties"]["periods"]:
            startTimeString = period["startTime"][:-6]
            endTimeString = period["endTime"][:-6]

            # Parse the ISO format string to datetime object
            startDateTime = datetime.strptime(startTimeString, "%Y-%m-%dT%H:%M:%S").replace(tzinfo=None)
            endDateTime = datetime.strptime(endTimeString, "%Y-%m-%dT%H:%M:%S").replace(tzinfo=None)

            # print(startDateTime, currentDateTime, endDateTime)

            if startDateTime <= currentDateTime and currentDateTime <= endDateTime:
                forecast = period["temperature"]
                unit = period["temperatureUnit"]

                if unit.upper()[0] == 'F':
                    forecast = (forecast - 32) * 5/9
                    forecast = round(forecast)
                    unit = "°C"

                print(f"{forecast}{unit}")
                exit(0)

print("ERROR")
