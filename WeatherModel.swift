//
//  WeatherModel.swift
//  Clima
//
//  Created by saeem  on 26/02/22.
//  Copyright © 2022 Saeem. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f" , temperature) // This is helping us create temperature to have a datatype of a string.
    }
    
    var conditionName: String { // This property is a computed property to create a computer property it always has to be a var because the value is always going to change. it's going to be based on the computation.
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
                } // We have created this property to easily print weather condition of a city.
    }
}
