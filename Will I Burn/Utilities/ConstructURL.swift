//
//  Constants.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 15/08/2021.
//

import Foundation

struct WeatherURL {
    private let baseURL = "https://api.worldweatheronline.com/premium/v1/weather.ashx"
    private let key = "&key=225a5faf72c14ec989284135211508"
    private let numDaysForecast = "&num_of_days=1"
    private let format = "&format=json"
    private var coordString = ""
    
    init(lat:String, long:String){
        self.coordString = "?q=\(lat),\(long)"
    }
    
    func getFullURL () -> String {
        return baseURL + coordString + key + numDaysForecast + format
    }
}
