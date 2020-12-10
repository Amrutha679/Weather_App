//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by amrutha on 10/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class WeatherViewModel: NSObject {
    
    var weatherService:WeatherService?
    var weatherData : WeatherData?
    var temperature:String {
        if let temp = self.weatherData?.main.temp {
            return String(format: ".0F",temp)
        }
        else{
            return ""
        }
    }
    var cityName:String?
    func search(){
        if let city = self.cityName {
            
            fetchWeather(by: city)
        }
    }
    override init() {
        self.weatherService = WeatherService()
    }
    func fetchWeather(by city: String){
        self.weatherService?.getWeather(from: city) { weatherData in
            if let weather = self.weatherData {
                self.weatherData = weather
            }
        }
    }
    func requestWeatherForLocation() {
        
        
        /* func jsonData() {
          //var weatherSummary: String?
         cityName = self.weatherData?.name
         var humidity = "\(Int(self.weatherData?.main.humidity ?? 0))%"
         var pressure = "\(Int(self.weatherData?.main.pressure ?? 0))Pa"
         var dateLabel = getDate(Date(timeIntervalSince1970: Double(self.weatherData?.dt ?? 0)) )
         var tempLabel = "\(Int(self.weatherData?.main.temp ?? 0)-273)°c"
         var tempMaxLabel = "\(Int(self.weatherData?.main.tempMax ?? 0)-273)°c"
         var tempMinLabel = "\(Int(self.weatherData?.main.tempMin ?? 0)-273)°c"
         var summaryLabel  = "\(self.weatherData?.weather[0].weatherDescription ?? "")"
         var weatherSummary = "\(self.weatherData?.weather[0].main ?? "")"
         //var summaryIcon = "\(self.weatherData?.weather[0].icon)"
         
         switch (weatherSummary) {
         
         case Constants.clouds:
         summaryIcon.image = UIImage(named:Constants.cloudicon)
         case Constants.haze:
         summaryIcon.image = UIImage(named:Constants.hazeicon)
         case Constants.sun:
         summaryIcon.image = UIImage(named:Constants.sunicon)
         case Constants.mist:
         summaryIcon.image = UIImage(named:Constants.misticon)
         case Constants.rain:
         summaryIcon.image = UIImage(named:Constants.rainicon)
         case Constants.clear:
         summaryIcon.image = UIImage(named:Constants.clearsky)
         case Constants.smoke:
         summaryIcon.image = UIImage(named:Constants.smokeicon)
         default:
         <#code#>
         }*/
    }
    
}

