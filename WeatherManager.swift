//
//  WeatherManager.swift
//  Clima
//
//  Created by saeem  on 20/02/22.
//  Copyright © 2022 Saeem. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=731129fb13e8f3b2cf43ee8aba885de7&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}

