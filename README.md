# Weather App

Weather App is a project that shows the current weather based on the user's location.

It runs on both mobile and web platforms.

## Getting Started

### Overview

This project contains three features:
1. Getting location
2. Getting the weather
3. Authentication

For both location and weather, I have created two feature-folder packages (**locator** and **meteorologist**, respectively). Be free to check those two before jumping into the project. They contain example and unit tests for a better understanding!

For the authentication, due to the fact that I did not have to implement a backend for it, I choose to keep it simple and put it inside the app project, instead of creating a single package for it, since its simple enough for the app to handle the authentication itself. 

### First of all!

Before running this app, one should do two things:

1. Create an API key at [Open Weather](https://openweathermap.org/). At the [API page](https://openweathermap.org/api), search for [Current & Forecast weather data collection](https://openweathermap.org/current) and create its key. Do not confuse with [One Call API](https://openweathermap.org/api/one-call-3)
2. Add the above key to the project as an Environment Variable called APIKEY. If you want to run the **meteorologist** example, you should do the same there. Here is a guide on how to do it: https://stackoverflow.com/questions/44250184/setting-environment-variables-in-flutter

## Running the project

Remember this project uses the user's device's location. So be aware for a dialog asking for the permission. You should allow it to fetch the weather data, but notice the project treats the cases where the user does not allow it. 

Also, some web browsers do not have the Permission API to handle the location information. I have tested using Chrome Browser and I recommend it for testing. 

![Login_mobile](https://github.com/opaulovieira/weather_app/blob/main/images/1.png)
![Weather_mobile](https://github.com/opaulovieira/weather_app/blob/main/images/3.png)
![Login_web](https://github.com/opaulovieira/weather_app/blob/develop/main/2.PNG)
![Weather_mobile](https://github.com/opaulovieira/weather_app/blob/main/images/4.PNG)
