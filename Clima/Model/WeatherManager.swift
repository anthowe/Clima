//
//  WeatherManager.swift
//  Clima
//
//  Created by Anthony Howe on 1/13/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=09d1aaf3e4e868e246cab0883a4de8b4&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let cityURL = cityName.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        let urlString = "\(weatherURL)&q=\(cityURL)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            //2. Create URL session
            let session = URLSession(configuration: .default)
            
            //3. Give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
        
        
    }
    func parseJSON(_ weatherData: Data) ->WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let humidity = decodedData.main.humidity
            let windSpeed = decodedData.wind.speed
            let degWindDirection = decodedData.wind.deg
      
       
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, humidity: humidity, speed: windSpeed, deg: degWindDirection)
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
