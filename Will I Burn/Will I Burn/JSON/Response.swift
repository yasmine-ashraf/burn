//
//  Response.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 15/08/2021.
//

import Foundation

struct Response: Codable {
    var maxtempC:String
    var maxtempF:String
    var mintempC:String
    var mintempF:String
    var sunHour:String
    var totalSnow:String
    var uvIndex:String
    
    enum CodingKeys: String, CodingKey {
       case maxtempC
       case maxtempF
       case mintempC
       case mintempF
       case sunHour
       case totalSnow = "totalSnow_cm"
       case uvIndex
     }
}

