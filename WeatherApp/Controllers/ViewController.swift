//
//  View Controller.swift
//  WeatherApp
//
//  Created by amrutha on 25/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    @IBOutlet weak var cityName: UITextField!
    let email:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if email != nil{
            print(email!)
        }
        
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToWeatherVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToWeatherVC" {
            
            let vc = segue.destination as! WeatherViewController
            vc.city = cityName.text!
        }
        
    }
    
}
