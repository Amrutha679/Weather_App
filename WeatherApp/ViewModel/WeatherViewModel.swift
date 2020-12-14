//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by amrutha on 10/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    var weatherService = WeatherService()
    var weatherData: WeatherData?
    
    func fetchWeather(by city: String, completion: @escaping(WeatherData?) -> ()) {
        
        self.weatherService.getWeather(from: city) { weatherData in
            if weatherData != nil {
                completion(weatherData)
            }
            else {
                completion(nil)
            }
        }
    }
}


