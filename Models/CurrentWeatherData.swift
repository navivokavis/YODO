//
//  CurrentWeatherData.swift
//  YODO
//
//  Created by s x on 21.09.22.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    
//    enum codingKeys: String, CodingKey {
//    case temp
//    case feelsLike = "feels_like"
//    }
}

struct Weather: Codable {
    let id: Int
}


