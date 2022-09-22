//
//  NetworkWeatherManager.swift
//  YODO
//
//  Created by s x on 20.09.22.
//

import Foundation



struct NetworkWeatherManager {
    
    var onCompletion: ((CurrentWeater) -> Void)?
    
    func fetchcurrentWeather(forCity city: String) {
        let usrString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: usrString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                    
                }
            }
        }
        task.resume()
    }
    
    
    func parseJSON (withData data: Data) -> CurrentWeater? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWeatherData.name)
            guard let currentWeather = CurrentWeater(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
