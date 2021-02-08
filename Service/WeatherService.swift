//
//  WeatherService.swift
//  myFirstApp
//
//  Created by SeoYeon on 2021/02/04.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WeatherService {
    let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=259f308de206333bce32c9e4762b9aab&units=metric")
    
    func getWeather(completion: @escaping (Result<Weather?, NetworkError>) -> Void) {
        guard let url = url else {
            print("badUrl")
            return completion(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("noData")
                return completion(.failure(.noData))
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse.main))
                print(weatherResponse)
            } else {
                print("decodingError")
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
