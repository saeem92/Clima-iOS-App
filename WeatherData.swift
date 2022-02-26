//
//  WeatherData.swift
//  Clima
//
//  Created by saeem  on 26/02/22.
//  Copyright © 2022 Saeem. All rights reserved.
//

import Foundation

struct WeatherData: Decodable { // Decodable is a type that can decode itself from an external representation which is json representation here.
    let name: String
    let main: Main
    let weather: [Weather] // the brackets here represents that weather is like an array here which consists multiple elements. IN our open weather api [weather] is an array of weather conditions that we are getting back which comes from the entire weather data
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
