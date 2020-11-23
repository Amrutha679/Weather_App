//
//  ForecastData.swift
//  WeatherApp
//
//  Created by amrutha on 19/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

struct ForecastData: Codable {
    let base :String?
}

// MARK: - Clouds
/*struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp 
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}*/






//request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXJ5YUBvbW5pd3lzZS5jb20iLCJzY29wZXMiOiJST0xFX0VNUExPWUVFX1MiLCJ0ZW5hbnROYW1lIjoib21uaXd5c2UiLCJ0ZW5hbnRJZCI6NzAwLCJpYXQiOjE1ODQ0NTAwMzgsImV4cCI6MTU4NDUzNjQzOCwiZW1wbG95ZWVJZCI6IjIwMTc3MDA0MyIsImVtYWlsIjoic3VyeWFAb21uaXd5c2UuY29tIiwicmVwb3J0ZXJJZCI6IjIwMTY3MDAwNyJ9.AS3M6J6dvieJWOVRPDPszV2vxrt3IPhT5Ulp_P67q1E", forHTTPHeaderField: "Authorization")
       
