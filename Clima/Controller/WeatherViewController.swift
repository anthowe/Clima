//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLable: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        weatherManager.delegate = self
        searchTextField.delegate = self
   
        
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
       
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         searchTextField.endEditing(true)
      
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       if let city = searchTextField.text{
            
           weatherManager.fetchWeather(cityName: city)
        }
        //if let zipCode = searchTextField.text{
       //     weatherManager.fetchWeather(zip: zipCode)
       // }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
            self.humidityLabel.text = weather.humidityString
            self.windSpeedLable.text = weather.speedString
            self.windDirectionLabel.text = weather.windDirectionInString
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

