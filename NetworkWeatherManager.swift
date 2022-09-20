//
//  NetworkWeatherManager.swift
//  YODO
//
//  Created by s x on 20.09.22.
//

import Foundation

struct NetworkWeatherManager {
    func currentWeather(forCity city: String) {
        let usrString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        guard let url = URL(string: usrString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
    }
}
