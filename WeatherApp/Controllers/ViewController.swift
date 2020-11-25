//
//  ViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var summaryIcon: UIImageView!
    
    var weatherData : WeatherData?
    var C = Constants()
    var img : String?
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var coordinates : CLLocation?
        
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
            
            if !locations.isEmpty, currentLocation == nil{
                
                currentLocation = locations.first
                locationManager.stopUpdatingLocation()
                
                }
        }
    
    func requestWeatherForLocation() {
        
            var semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: C.url)!,timeoutInterval: Double.infinity)
        request.addValue(C.value, forHTTPHeaderField:C.httpField )

        request.httpMethod = C.get

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
                }
               
              print(String(data: data, encoding: .utf8)!)
              semaphore.signal()
                do{
                    let decoder = JSONDecoder()
                        let response = try decoder.decode(WeatherData.self, from: data)
                        DispatchQueue.main.async {
                            
                            self.weatherData = response
                           // print(self.forecastData?.base)
                            self.cityName.text = self.weatherData?.name
                            self.dateLabel.text = self.getDate(Date(timeIntervalSince1970: Double(self.weatherData?.dt ?? 0)) )
                            self.tempLabel.text = "\(Int(self.weatherData?.main.temp ?? 0)-273)°c"
                            self.summaryLabel.text  = "\(self.weatherData?.weather[0].weatherDescription ?? "")"
                            
                            self.img = "\(self.weatherData?.weather[0].main ?? "")"
                            
                            switch (self.img) {
                            case self.C.clouds:
                                self.summaryIcon.image = UIImage(named:self.C.cloudicon)
                                
                            case self.C.haze:
                                
                                self.summaryIcon.image = UIImage(named:self.C.hazeicon)
                            case self.C.sun:
                                self.summaryIcon.image = UIImage(named:self.C.sunicon)
                                
                            case .none:
                                
                                print("hh")
                            case .some(_):
                                
                                print("")
                           
                            }
                            
                        }
                       
                    }
                    catch {
                        print(error)
                }
               
                
            }
            task.resume()
            semaphore.wait()
            

        }
          
    func getDate(_ date:Date?) -> String{
        
        guard let inputDate = date else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: inputDate)
    }
}



