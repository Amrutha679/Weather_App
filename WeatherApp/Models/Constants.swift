//
//  Constants.swift
//  WeatherApp
//
//  Created by amrutha on 25/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation
struct Constants {
    static let city : String = ""
    init(city : String)
    {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(Constants.self.city)&appid=476e970d980b944a09b51d1fa68c9adb"
    }
   
   static let get = "GET"
   static let value = "application/json"
   static let httpField = "Content-Type"
   static let clouds = "Clouds"
   static let cloudicon = "cloud"
   static let haze = "Haze"
   static let hazeicon = "haze"
   static let sun = "Sun"
   static let sunicon = "sun"
   static let mist = "Mist"
   static let misticon = "mist"
   static let rain = "Rain"
   static let rainicon = "rain-icon"
   static let clear = "Clear"
   static let clearsky = "clear"
   static let smoke = "Smoke"
   static let smokeicon = "smoke"
}
