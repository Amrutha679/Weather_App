//
//  View Controller.swift
//  WeatherApp
//
//  Created by amrutha on 25/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        field.returnKeyType = .done
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.delegate = self
    }
    
    @IBAction func buttonTapped() {
        
        if field.text?.count != 0 {
            
            performSegue(withIdentifier: Constants.identifier, sender: self)
            
        } else {
            let alert = UIAlertController(title:nil, message:"Enter city name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? WeatherViewController
        if vc != nil  {
            vc?.city = field.text ?? ""
        } 
    }
}
extension RootViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


