//
//  Utilities.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 15/08/2021.
//

import Foundation

class UserDefFunctions {
    func setSkinType(value:String) {
        let defaults = UserDefaults.standard
        defaults.setValue(value, forKey: defaultsKeys.skinType)
        defaults.synchronize()
    }
    func getSkinType() -> String {
        let defaults = UserDefaults.standard
        if let result = defaults.string(forKey: defaultsKeys.skinType){
            return result
        }
        else { return SkinType().type1
        }
    }
}
