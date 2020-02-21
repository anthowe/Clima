//
//  WeatherModel.swift
//  Clima
//
//  Created by Anthony Howe on 1/14/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    let conditionId: Int
    let cityName: String
    let temperature: Double
    let humidity: Int
    let speed: Double
    let deg: Int
    
    
    var temperatureString: String{
        return String(format: "%.0f", temperature)
    }
    var humidityString: String{
        return String(humidity)
    }
    
    var speedString: String{
        return String(format: "%.0f", speed)
    }
    
    var degString: String{
        return String(deg)
    }
    var conditionName:String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    var windDirectionInString:String{
        switch deg {
        case 0...11:
            return "N"
        case 12...34:
            return "NNE"
        case 35...56:
            return "NE"
        case 57...79:
            return "ENE"
        case 80...101:
            return "E"
        case 102...124:
            return "ESE"
        case 125...146:
            return "SE"
        case 147...168:
            return "SSE"
        case 169...191:
            return "S"
        case 192...214:
            return "SSW"
        case 215...236:
            return "SW"
        case 237...259:
            return "WSW"
        case 260...281:
            return "W"
        case 282...304:
            return "WNW"
        case 305...326:
            return "NW"
        case 327...348:
            return "NNW"
        case 349...360:
            return "N"
        default:
            return "Calm"
        }
        
    }
    
    
}




