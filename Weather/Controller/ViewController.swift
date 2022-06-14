//
//  ViewController.swift
//  Weather
//
//  Created by MacBook Pro on 2022-06-02.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLiketemperatureLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.onComplition = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterFace(with: currentWeather)
        }
        networkWeatherManager.fetchCurrentWeather(for: "Vilnius")
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(with: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            
            self.networkWeatherManager.fetchCurrentWeather(for: city) 
            
        }
    }
    func updateInterFace(with currentWeather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = currentWeather.cityName
            self.temperatureLabel.text = currentWeather.tempetarureString + "℃"
            self.feelsLiketemperatureLabel.text = currentWeather.feelsLikeTempString + "℃"
            self.weatherIconImageView.image = UIImage(systemName: currentWeather.systemIconNameString)
        }
    }
}


