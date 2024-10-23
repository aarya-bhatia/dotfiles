#!/usr/bin/env python3
import os
import sys
import requests
from datetime import datetime

cache_dir = "/home/aarya/.cache/weather"
cache_filepath = f"{cache_dir}/default"


def log(message):
    sys.stderr.write(str(message) + "\n")


def get_forecast_url(latitude, longitude):
    try:
        url = f"https://api.weather.gov/points/{latitude},{longitude}"
        response = requests.get(url)
        log(f"GET {url}: {response.status_code}")
        if response.status_code == 200:
            return response.json()["properties"]["forecastHourly"]
        log(response.content)
    except Exception as e:
        sys.stderr.write(str(e))
        return None


def temp_in_C(temp_in_F):
    return round((temp_in_F - 32) * 5 / 9)


def update_cache(url):
    try:
        response = requests.get(url)

        if response.status_code == 200:
            data = response.json()

            for period in data["properties"]["periods"]:
                date = period["startTime"][:10]
                filename = os.path.join(cache_filepath, date)

                shortForecast = period["shortForecast"]

                if period["temperatureUnit"] == "F":
                    temperature = temp_in_C(period["temperature"])
                else:
                    temperature = period["temperature"]

                with open(filename, "a") as file:
                    line = " ".join([
                        period["startTime"][:-6],
                        period["endTime"][:-6],
                        str(temperature),
                        shortForecast
                    ])

                    file.write(f"{line}\n")

                log(f"Cache updated: {cache_filepath}/{date}")
        else:
            log(f"ERROR: HTTP {response.status_code}: {response.content}")
    except Exception as e:
        log(e)
        return


def get_forecast(force_update_cache=False) -> (str | None, str | None):
    currentDateTime = datetime.now().replace(tzinfo=None)
    currentDate = currentDateTime.strftime("%Y-%m-%d")
    cache_filename = os.path.join(cache_filepath, currentDate)

    if force_update_cache or not os.path.exists(cache_filename):
        url = get_forecast_url(latitude, longitude)
        log(f"forecast url: {url}")
        if url:
            update_cache(url)

    return get_cached_forecast(cache_filename)


def get_cached_forecast(cache_filename) -> (str | None, str | None):
    currentDateTime = datetime.now().replace(tzinfo=None)
    with open(cache_filename, "r") as file:
        lines = file.readlines()

        for line in lines:
            items = line.split()
            startTime = items[0]
            endTime = items[1]
            temperature = items[2]
            shortForecast = ' '.join(items[3:])

            startTime = datetime.strptime(startTime, "%Y-%m-%dT%H:%M:%S")
            startTime = startTime.replace(tzinfo=None)
            endTime = datetime.strptime(endTime, "%Y-%m-%dT%H:%M:%S")
            endTime = endTime.replace(tzinfo=None)

            if startTime <= currentDateTime and currentDateTime <= endTime:
                print(shortForecast, file=sys.stderr)
                return f"{temperature}°C", shortForecast

    return None, None


if __name__ == "__main__":
    force_update_cache = False
    if len(sys.argv) == 2 and sys.argv[1] == "-f":
        force_update_cache = True

    latitude = os.getenv("LATITUDE", "")
    longitude = os.getenv("LONGITUDE", "")

    if not latitude or not longitude:
        raise Exception("Location unspecified")

    log((latitude, longitude))

    cache_filepath = f"{cache_dir}/{latitude}:{longitude}"
    os.system(f"mkdir -p {cache_filepath}")

    try:
        forecast, short = get_forecast(force_update_cache)
        if not forecast:
            raise Exception("Forecast unavailable")

        print(forecast, flush=True)

    except Exception as e:
        log(e)
