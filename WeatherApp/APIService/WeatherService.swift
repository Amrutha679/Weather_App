//
//  WeatherService.swift
//  WeatherApp
//
//  Created by amrutha on 10/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class WeatherService {
    
    func getWeather(_ city:String, completion: @escaping(WeatherData?) -> ()) {
        
        guard let request = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=476e970d980b944a09b51d1fa68c9adb") else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            guard let data = data else {
                return
            }
            let jsonResponse = try? JSONDecoder().decode(WeatherData.self, from: data)
            if let weatherResponse = jsonResponse {
                let weather = weatherResponse
                completion(weather)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
