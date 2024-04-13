//
//  BurnTime.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 16/08/2021.
//

import Foundation

extension ViewController{
    func calcBurnTime(_ myUV:String) -> Double {
        var minutesToBurn: Double
        switch skinType{
        case SkinType().type1:
            minutesToBurn = BurnTime().burnType1
            
        case SkinType().type2:
            minutesToBurn = BurnTime().burnType2
            
        case SkinType().type3:
            minutesToBurn = BurnTime().burnType3
            
        case SkinType().type4:
            minutesToBurn = BurnTime().burnType4
            
        case SkinType().type5:
            minutesToBurn = BurnTime().burnType5
            
        case SkinType().type6:
            minutesToBurn = BurnTime().burnType6
        default:
            minutesToBurn = BurnTime().burnType1
        }
        return minutesToBurn / Double(myUV)!
    }
}
struct BurnTime {
    //in minutes
    let burnType1:Double = 67
    let burnType2:Double = 100
    let burnType3:Double = 200
    let burnType4:Double = 300
    let burnType5:Double = 400
    let burnType6:Double = 500
}

