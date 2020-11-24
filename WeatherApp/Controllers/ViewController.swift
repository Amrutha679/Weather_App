//
//  ViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate{
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
   // @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var summeryLabel: UILabel!
    @IBOutlet weak var summeryIcon: UIImageView!
    
    var forecastData : ForecastData?
   // var main : Main?
    
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
        
            let long = currentLocation?.coordinate.longitude
            let lat = currentLocation?.coordinate.latitude
        
            var semaphore = DispatchSemaphore (value: 0)
            var request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=476e970d980b944a09b51d1fa68c9adb")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
              guard let data = data else {
                print(String(describing: error))
                return
                }
               
              print(String(data: data, encoding: .utf8)!)
              semaphore.signal()
                do{
                    let decoder = JSONDecoder()
                        let response = try decoder.decode(ForecastData.self, from: data)
                        DispatchQueue.main.async {
                            
                            self.forecastData = response
                           // print(self.forecastData?.base)
                            self.cityName.text = self.forecastData?.name
                            self.dateLabel.text = self.getDate(Date(timeIntervalSince1970: Double(self.forecastData?.dt ?? 0)) )
                            self.tempLabel.text = "\(self.forecastData?.main.temp ?? 0)"
                            self.summeryLabel.text  = "\(self.forecastData?.weather[0].weatherDescription ?? "")"
                           // self.summeryIcon.image = UIImage(named:"\(self.forecastData?.weather[0].icon ?? "")")
                            //print("\(self.forecastData?.dt ?? 0)")
                            //print( "\(self.forecastData?.main.temp ?? 0)")
                           // print("Weather is \(self.forecastData?.weather. ?? 0 )")
                           // print("main is \(self.forecastData?.main)")
                            print("\(self.forecastData?.weather[0].icon ?? "")")
                            
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



