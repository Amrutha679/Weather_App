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
        field.becomeFirstResponder()
        field.delegate = self
    }
    
    @IBAction func buttonTapped() {
        
        field.resignFirstResponder()
        performSegue(withIdentifier: Constants.identifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? WeatherViewController
        vc?.city = field.text!
    }
}

extension RootViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

