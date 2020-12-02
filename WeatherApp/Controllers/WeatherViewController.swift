//
//  ViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var summaryIcon: UIImageView!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    
   public var city : String = ""
   public var img : String?
    var weatherData : WeatherData?
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocation()
        requestWeatherForLocation() }
    
    func setupLocation() {
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !locations.isEmpty, currentLocation == nil {
            
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            
        }
    }
    
    func requestWeatherForLocation() {
        
        var request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=476e970d980b944a09b51d1fa68c9adb")!,timeoutInterval: Double.infinity)
        request.addValue(Constants.value, forHTTPHeaderField:Constants.httpField )
        request.httpMethod = Constants.get

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }

            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    
                    self.weatherData = response
                    self.jsonData()
                    
                }
                
            }
            catch {
                print(error.localizedDescription)
            }
            
            
        }
        task.resume()
        
    }
    func jsonData() {
        self.cityName.text = self.weatherData?.name
        self.humidity.text = "\(Int(self.weatherData?.main.humidity ?? 0))%"
        self.pressure.text = "\(Int(self.weatherData?.main.pressure ?? 0))hPa"
        self.dateLabel.text = getDate(Date(timeIntervalSince1970: Double(self.weatherData?.dt ?? 0)) )
        self.tempLabel.text = "\(Int(self.weatherData?.main.temp ?? 0)-273)°c"
        self.tempMaxLabel.text = "\(Int(self.weatherData?.main.tempMax ?? 0)-273)°c"
        self.tempMinLabel.text = "\(Int(self.weatherData?.main.tempMin ?? 0)-273)°c"
        self.summaryLabel.text  = "\(self.weatherData?.weather[0].weatherDescription ?? "")"
        self.img = "\(self.weatherData?.weather[0].main ?? "")"
        
        switch (self.img) {
            
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
        case .none:
            self.summaryIcon.image = UIImage(named:Constants.smokeicon)
        case .some(_):
            self.summaryIcon.image = UIImage(named:Constants.smokeicon)
            
            
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

