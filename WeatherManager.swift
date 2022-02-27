//
//  WeatherManager.swift
//  Clima
//
//  Created by saeem  on 20/02/22.
//  Copyright © 2022 Saeem. All rights reserved.
//

import Foundation
import CoreLocation

// Creating a protocol below
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
    // Above we have created another delegate method which is going to help to be able to pass errors out of the weather manager
}

struct WeatherManager {
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=731129fb13e8f3b2cf43ee8aba885de7&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
    let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        //1. Create a URL
        
        if let url = URL(string: urlString){
            
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default) // Here we have are creating a url session object which is effectively like the json result we see in our browser.
            
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return // This is helping us to use our anonymous function here which is termed as closure in swift.
                }
                if let safeData = data {
                    
                    if let weather = self.parseJSON(weatherData: safeData) { // INSIDE THE CLOSURE THE RULE IS WE MUST ADD THE WORD SELF IF WE ARE CALLING A METHOD FROM THE CURRENT CLASS.
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error){ // This method is going to take all of the inputs that are prescribed right here
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder() // JSONDecoder is an object that can decode json.
        do {
       let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    
    }
}
    

