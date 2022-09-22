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
    var forWeaterIconImageView = UIView()
    var weatherIconImageView = UIImageView()
    var searchButton = UIButton()
    var magnifyImage = UIImage()
    var newSize = CGSize(width: 200, height: 100)
    let scaledImageSize = 4
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        networkWeatherManager.fetchcurrentWeather(forCity: "Minsk")
        setup()
        
    }
    
    func setup() {
        layoutSubviews()
        configureSubviews()
        buildHierarchy()
    }
    
    func layoutSubviews() {
        view.addSubview(cityLabel)
        view.addSubview(tempLabel)
        view.addSubview(searchButton)

        view.addSubview(forWeaterIconImageView)
        forWeaterIconImageView.addSubview(weatherIconImageView)
        view.addSubview(feelsLikeLabel)
    }
    
    func configureSubviews() {
        magnifyImage = UIImage(systemName: "magnifyingglass.circle")!
        
        searchButton.setImage(magnifyImage, for: .normal)
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(pressSearchButton), for: .touchUpInside)
        
        cityLabel.textColor = .white
        cityLabel.font = .systemFont(ofSize: 60)
        
        weatherIconImageView.tintColor = .white
        
        
        tempLabel.font = .systemFont(ofSize: 50)
        
        feelsLikeLabel.font = .systemFont(ofSize: 35)
        
        
    }
    
    func buildHierarchy() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
        searchButton.imageView?.layer.transform = CATransform3DMakeScale(3, 3, 3)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        forWeaterIconImageView.translatesAutoresizingMaskIntoConstraints = false
        forWeaterIconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        forWeaterIconImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        weatherIconImageView.frame
//        weatherIconImageView.layer.transform = CATransform3DMakeScale(5, 5, 5)
        forWeaterIconImageView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 70).isActive = true
        forWeaterIconImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherIconImageView.trailingAnchor.constraint(equalTo: forWeaterIconImageView.trailingAnchor).isActive = true
        weatherIconImageView.leadingAnchor.constraint(equalTo: forWeaterIconImageView.leadingAnchor).isActive = true
        weatherIconImageView.bottomAnchor.constraint(equalTo: forWeaterIconImageView.bottomAnchor).isActive = true
        weatherIconImageView.topAnchor.constraint(equalTo: forWeaterIconImageView.topAnchor).isActive = true

        
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 50).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
        
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20).isActive = true
        feelsLikeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
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
                //                self.cityLabel.text = cityName
                
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
        self.feelsLikeLabel.text = weather.feelsLikeTemperatureString + " °C"
        self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
}
