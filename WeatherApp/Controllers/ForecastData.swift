//
//  ForecastData.swift
//  WeatherApp
//
//  Created by amrutha on 19/11/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

struct ForecastData: Decodable {
    
    let city : String?
    let base: String?
}





//request.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdXJ5YUBvbW5pd3lzZS5jb20iLCJzY29wZXMiOiJST0xFX0VNUExPWUVFX1MiLCJ0ZW5hbnROYW1lIjoib21uaXd5c2UiLCJ0ZW5hbnRJZCI6NzAwLCJpYXQiOjE1ODQ0NTAwMzgsImV4cCI6MTU4NDUzNjQzOCwiZW1wbG95ZWVJZCI6IjIwMTc3MDA0MyIsImVtYWlsIjoic3VyeWFAb21uaXd5c2UuY29tIiwicmVwb3J0ZXJJZCI6IjIwMTY3MDAwNyJ9.AS3M6J6dvieJWOVRPDPszV2vxrt3IPhT5Ulp_P67q1E", forHTTPHeaderField: "Authorization")
       
