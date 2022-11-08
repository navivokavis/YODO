//
//  DateAndWeatherViewController.swift
//  YODO
//
//  Created by s x on 9.09.22.
//

import UIKit

class DateAndWeatherViewController: UIViewController {
    
    
    var networkWeatherManager = NetworkWeatherManager()
    var cityLabel = UILabel()
    var tempLabel = UILabel()
    var feelsLikeLabel = UILabel()
    var weatherIconImageView = UIImageView()
    var searchButton = UIButton()
    var magnifyImage = UIImage()
    var forTemperatureView = UIView()
    var forImageAndTemperatureView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        setup()
        
    }
    
    func setup() {
        layoutSubviews()
        configureSubviews()
        buildHierarchy()
    }
    
    func layoutSubviews() {
        view.addSubview(cityLabel)
        view.addSubview(searchButton)
        view.addSubview(forImageAndTemperatureView)
        forImageAndTemperatureView.addSubview(weatherIconImageView)
        forImageAndTemperatureView.addSubview(forTemperatureView)
        forTemperatureView.addSubview(tempLabel)
        forTemperatureView.addSubview(feelsLikeLabel)
    }
    
    func configureSubviews() {
        networkWeatherManager.fetchcurrentWeather(forCity: "Minsk")
        
        magnifyImage = UIImage(systemName: "magnifyingglass.circle")!
        
        searchButton.setImage(magnifyImage, for: .normal)
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(pressSearchButton), for: .touchUpInside)
        searchButton.contentMode = .scaleAspectFill
        searchButton.contentVerticalAlignment = .fill
        searchButton.contentHorizontalAlignment = .fill
        
        cityLabel.textColor = .white
        cityLabel.font = .systemFont(ofSize: 80)
        
        weatherIconImageView.contentMode = .scaleAspectFill
        weatherIconImageView.tintColor = .white
        
        tempLabel.font = .systemFont(ofSize: 50)
        tempLabel.textColor = .white
        
        feelsLikeLabel.font = .systemFont(ofSize: 20)
        feelsLikeLabel.textColor = .white
        feelsLikeLabel.numberOfLines = 0
        feelsLikeLabel.textAlignment = .center
        
    }
    
    func buildHierarchy() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        forImageAndTemperatureView.backgroundColor = .brown
        forImageAndTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        forImageAndTemperatureView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forImageAndTemperatureView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        forImageAndTemperatureView.contentMode = .center
        forImageAndTemperatureView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        forImageAndTemperatureView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        forImageAndTemperatureView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5).isActive = true
        
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherIconImageView.leftAnchor.constraint(equalTo: forImageAndTemperatureView.leftAnchor, constant: 40).isActive = true
        weatherIconImageView.topAnchor.constraint(equalTo: forImageAndTemperatureView.topAnchor, constant: 30).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        weatherIconImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        forTemperatureView.translatesAutoresizingMaskIntoConstraints = false
        forTemperatureView.rightAnchor.constraint(equalTo: forImageAndTemperatureView.rightAnchor, constant: -40).isActive = true
        forTemperatureView.topAnchor.constraint(equalTo: forImageAndTemperatureView.topAnchor, constant: 20).isActive = true
        forTemperatureView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        forTemperatureView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.topAnchor.constraint(equalTo: forTemperatureView.topAnchor, constant: 5).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: forTemperatureView.centerXAnchor).isActive = true
        
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 5).isActive = true
        feelsLikeLabel.centerXAnchor.constraint(equalTo: forTemperatureView.centerXAnchor).isActive = true
        
    }
    
    @objc func pressSearchButton() {
        presentSearchAlertController()
    }
    
    func presentSearchAlertController() {
        let message = "Введите город"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField()
        
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                self.networkWeatherManager.fetchcurrentWeather(forCity: cityName.split(separator: " ").joined(separator: "%20"))
                
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true)
        
    }
    
    func updateInterfaceWith(weather: CurrentWeater) {
        DispatchQueue.main.async {
        self.cityLabel.text = weather.cityName
        self.tempLabel.text = weather.temperatureString + " °C"
        self.feelsLikeLabel.text = "Ощущается как \n" + weather.feelsLikeTemperatureString + " °C"
        self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
            
            print(weather.temperature)
            switch weather.temperature {
            case -287...0:
                self.view.backgroundColor = .blue
            case 0.01...10.99:
                self.view.backgroundColor = .systemBlue
            case 11...18.99:
                self.view.backgroundColor = .systemCyan
            case 19...22.99:
                self.view.backgroundColor = .systemOrange
            case 23...25.99:
                self.view.backgroundColor = .orange
            case 26...33.99:
                self.view.backgroundColor = .systemRed
            case 34...90:
                self.view.backgroundColor = .red
            default:
                self.view.backgroundColor = .black
            }
            
        }
        
    }
    
    
}
