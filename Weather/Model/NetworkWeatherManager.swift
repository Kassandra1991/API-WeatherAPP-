//
//  NetworkWeatherManager.swift
//  Weather
//
//  Created by MacBook Pro on 2022-06-07.
//

import Foundation

//protocol NetworkWeatherManagerDelegate: AnyObject {
//
//    func updateInterFace(_: NetworkWeatherManager,with currentWeather: CurrentWeather)
//
//}


class NetworkWeatherManager {
    
    var onComplition: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(for city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onComplition?(currentWeather)
                }
                
            }
        }
    
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch
            let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}