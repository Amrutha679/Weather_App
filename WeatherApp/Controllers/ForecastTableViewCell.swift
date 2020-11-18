//
//  ForecastTableViewCell.swift
//  WeatherApp
//
//  Created by amrutha on 18/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var latLable: UILabel!
    @IBOutlet weak var lonLable: UILabel!
    
    
  /*  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    func gettingData()
    {
        let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=Chicago&appid=1c2f47340db7f7b1539792594a950c6e")
        let session = URLSession.shared
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("api.openweathermap.org/data/2.5/weather?q=Chicago&appid=1c2f47340db7f7b1539792594a950c6e", forHTTPHeaderField: "Authorization")
       // let task = session.dataTask(with: request as URLRequest,completionHandler: })
        
    }
    
}
