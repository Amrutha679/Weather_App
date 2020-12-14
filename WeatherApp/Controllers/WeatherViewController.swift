//
//  ViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var summaryIcon: UIImageView!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    
    var weatherViewModel = WeatherViewModel()
    var city: String = ""
    var weatherSummary: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        jsonData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.view.tintColor = UIColor.blue
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func jsonData() {
        
        weatherViewModel.fetchWeather(by: city){ weatherData in
            if weatherData != nil {
                DispatchQueue.main.async {
                    
                    self.cityName.text = "\(weatherData?.name ?? "")"
                    self.humidity.text = "\(Int(weatherData?.main.humidity ?? 0))%"
                    self.pressure.text = "\(Int(weatherData?.main.pressure ?? 0))Pa"
                    self.dateLabel.text = self.getDate(Date(timeIntervalSince1970: Double(weatherData?.dt ?? 0)) )
                    self.tempLabel.text = "\(Int(weatherData?.main.temp ?? 0)-273)°c"
                    self.tempMaxLabel.text = "\(Int(weatherData?.main.tempMax ?? 0)-273)°c"
                    self.tempMinLabel.text = "\(Int(weatherData?.main.tempMin ?? 0)-273)°c"
                    self.summaryLabel.text  = "\(weatherData?.weather[0].weatherDescription ?? "")"
                    self.weatherSummary = "\(weatherData?.weather[0].main ?? "")"
                    
                    switch (self.weatherSummary) {
                        
                    case Constants.clouds:
                        self.summaryIcon.image = UIImage(named:Constants.cloudicon)
                    case Constants.haze:
                        self.summaryIcon.image = UIImage(named:Constants.hazeicon)
                    case Constants.sun:
                        self.summaryIcon.image = UIImage(named:Constants.sunicon)
                    case Constants.mist:
                        self.summaryIcon.image = UIImage(named:Constants.misticon)
                    case Constants.rain:
                        self.summaryIcon.image = UIImage(named:Constants.rainicon)
                    case Constants.clear:
                        self.summaryIcon.image = UIImage(named:Constants.clearsky)
                    case Constants.smoke:
                        self.summaryIcon.image = UIImage(named:Constants.smokeicon)
                    default: break
                        
                    }
                    
                }
            }
        }
    }
    public func getDate(_ date:Date?) -> String {
        
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: inputDate)
    }
}



