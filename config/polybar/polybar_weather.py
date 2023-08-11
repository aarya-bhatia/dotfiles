#!/usr/bin/env python3
import requests
from datetime import datetime
import sys


def get_forecast_url(latitude, longitude):
    try:
        response = requests.get(
            f"https://api.weather.gov/points/{latitude},{longitude}")
        if response.status_code == 200:
            return response.json()["properties"]["forecastHourly"]
    except:
        return None


def get_forecast(url):
    if not url:
        return None

    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        currentDateTime = datetime.now().replace(tzinfo=None)

        for period in data["properties"]["periods"]:
            startTimeString = period["startTime"][:-6]
            endTimeString = period["endTime"][:-6]

            # Parse the ISO format string to datetime object
            startDateTime = datetime.strptime(
                startTimeString, "%Y-%m-%dT%H:%M:%S").replace(tzinfo=None)
            endDateTime = datetime.strptime(
                endTimeString, "%Y-%m-%dT%H:%M:%S").replace(tzinfo=None)

            # print(startDateTime, currentDateTime, endDateTime)
            sys.stderr.write(f"{startDateTime},{currentDateTime},{endDateTime}\n")

            if startDateTime <= currentDateTime and currentDateTime <= endDateTime:
                forecast = period["temperature"]
                unit = period["temperatureUnit"]

                if unit.upper()[0] == 'F':
                    forecast = (forecast - 32) * 5/9
                    forecast = round(forecast)
                    unit = "°C"

                return f"{forecast}{unit}"
    else:
        sys.stderr.write(f"Request failed with HTTP status code: {response.status_code}\n")

    return None


SFO_lat = "37.7875"
SFO_long = "-122.3905"

url = get_forecast_url(SFO_lat, SFO_long)
sys.stderr.write(f"URL: {url}\n")
forecast = get_forecast(url)
sys.stderr.write(f"Forecast: {forecast}\n")

if forecast:
    print(forecast)
else:
    print("Error")
