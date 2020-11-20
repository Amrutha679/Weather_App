//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController,CLLocationManagerDelegate{
    
    var forecastData : ForecastData?
    
    @IBOutlet weak var latlabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print("hello")
        
        setupLocation()
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
            requestWeatherForLocation()
            
            }
    }
    
    func requestWeatherForLocation()
    {
        let long = currentLocation?.coordinate.longitude
        let lat = currentLocation?.coordinate.latitude
        print(long)
        print(lat)
    
    
    //func gettingData(){
        
        
        let session = URLSession.shared
       // let urlString = "api.openweathermap.org/data/2.5/weather?q=Chicago&appid=1c2f47340db7f7b1539792594a950c6e"
        //let validUrlString = urlString.hasPrefix("http") ? urlString : "http://(urlString)"
        //print("validurl is \(validUrlString)")
        
        let url = URL(string:"https://community-open-weather-map.p.rapidapi.com/weather?q=Chicago%2Cuk&lat=0&lon=\(long)&callback=test&id=2172797&lang=\(lat)&units=%22metric%22%20or%20%22imperial%22&mode=xml%2C%20html")!
        //var request = URLRequest(url: url)
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval:10.0 )
        let headers = ["x-rapidapi-key": "d1ba0406c0msh795d9cc32acd6fcp15b82djsn91be053bbf3d",
            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com"]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
           
        let task = session.dataTask(with: request as URLRequest,completionHandler: { data, response, error in
            
            print("task is completed")
            
            guard error == nil else {
                
                return
            }
            guard let data = data else {
                
                return
            }
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(ForecastData.self, from: data)
                //let jsonResult = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                //if let results = jsonResult["results"] as? [Any]{
          
                DispatchQueue.main.async {
                    
                    self.forecastData = response
                    print("response is \(response)")
                    
                    self.latlabel.text = "\(self.forecastData?.city ?? "")"
                    self.lonLabel.text = "\(self.forecastData?.base ?? "")"
                }
                
            }
            catch {
                
                print("error")
            }
            print("data is",data)
           // print("response is",response)
           // print("error is \(error)")
            print("error is",error)
        })
       task.resume()
    
    
    }

}
