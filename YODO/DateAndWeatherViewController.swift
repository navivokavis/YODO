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
    var searchButton = UIButton()
    var magnifyImage = UIImage()
    var cityName = "Minsk"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        networkWeatherManager.currentWeather(forCity: "Minsk")
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
    }
    
    func configureSubviews() {
        magnifyImage = UIImage(systemName: "magnifyingglass.circle")!
        
        searchButton.setImage(magnifyImage, for: .normal)
        searchButton.tintColor = .black
        searchButton.addTarget(self, action: #selector(pressSearchButton), for: .touchUpInside)
        
        cityLabel.textColor = .white
        cityLabel.font = .systemFont(ofSize: 60)
        cityLabel.text = cityName
        
        
    }
    
    func buildHierarchy() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -70).isActive = true
        searchButton.imageView?.layer.transform = CATransform3DMakeScale(3, 3, 3)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func pressSearchButton() {
        presentAlertController()
    }
    
    func presentAlertController() {
        let message = "Введите город"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField()
        
        let search = UIAlertAction(title: "Поиск", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                self.networkWeatherManager.currentWeather(forCity: cityName)
                self.cityLabel.text = cityName
                cityName.split(separator: " ").joined(separator: "%20")
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true)
        
        
    }
    
}
