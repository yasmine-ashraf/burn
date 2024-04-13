//
//  DataJSON.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 16/08/2021.
//

import Foundation

struct mainData: Codable {
    var weather: [Response]
    enum CodingKeys: String, CodingKey {
        case weather
    }
}

struct Main: Codable {
    var data: mainData
}
