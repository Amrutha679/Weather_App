//
//  ForecastData.swift
//  WeatherApp
//
//  Created by amrutha on 19/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let clouds: Clouds
    let dt: Int
    let name: String
    let cod: Int
}

struct Clouds: Codable {
    let all: Int
}

struct Coord: Codable {
    let lon, lat: Double
}

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

struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}


