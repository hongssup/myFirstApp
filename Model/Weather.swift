//
//  Weather.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/02/01.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather : Decodable{
    let temp: Double
    let humidity: Int
}


