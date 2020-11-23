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
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var forecastData : ForecastData?
    
     let locationManager = CLLocationManager()
     var currentLocation: CLLocation?
     var coordinates : CLLocation?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
             //print("hello")
            
            setupLocation()
            requestWeatherForLocation()
          //  gettingData()

            // Do any additional setup after loading the view.
    }
       
        
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
      func requestWeatherForLocation()
        {
            let long = currentLocation?.coordinate.longitude
            let lat = currentLocation?.coordinate.latitude
           // let name = currentLocation?.copy(with NSSetZoneName:String )
            print(long)
            print(lat)
            let name : String = "Chicago"
        
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
                            //self.dateLabel.text = self.forecastData?.dt
                           // self.tempLabel.text = self.forecastData?.main.temp ? 0
                          //  self.descriptionLabel.text  = self.forecastData?.Weather.description
                            
                            
                        }
                    }
                    catch {
                        print(error)
                }
            }
            task.resume()
            semaphore.wait()
            

        }
    }



