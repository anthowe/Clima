//
//  WeatherData.swift
//  Clima
//
//  Created by Anthony Howe on 1/13/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}
struct Main: Decodable{
    let temp: Double
    let humidity: Int
    
}
struct Weather: Decodable {
    let id: Int
}

struct Wind: Decodable{
    let speed: Double
    let deg: Int
}
