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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel.requestWeatherForLocation()
        updateJsonData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.view.tintColor = UIColor.blue
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    func updateJsonData(){
        
        cityName.text = weatherViewModel.cityName
        city = weatherViewModel.location ?? "'"
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

