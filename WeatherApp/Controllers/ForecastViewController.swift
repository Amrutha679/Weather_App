//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by amrutha on 17/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
}
    func gettingData(){
        
        let session = URLSession.shared
        let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=Chicago&appid=1c2f47340db7f7b1539792594a950c6e")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXJ5YUBvbW5pd3lzZS5jb20iLCJzY29wZXMiOiJST0xFX0VNUExPWUVFX1MiLCJ0ZW5hbnROYW1lIjoib21uaXd5c2UiLCJ0ZW5hbnRJZCI6NzAwLCJpYXQiOjE1ODQ0NTAwMzgsImV4cCI6MTU4NDUzNjQzOCwiZW1wbG95ZWVJZCI6IjIwMTc3MDA0MyIsImVtYWlsIjoic3VyeWFAb21uaXd5c2UuY29tIiwicmVwb3J0ZXJJZCI6IjIwMTY3MDAwNyJ9.AS3M6J6dvieJWOVRPDPszV2vxrt3IPhT5Ulp_P67q1E", forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request as URLRequest,completionHandler: {data,response,error in
            
            print(data)
            print(response)
            print("error is \(error)")
        })
        task.resume()
        
        
        
    }
    
    

}
