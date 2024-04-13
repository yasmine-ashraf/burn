//
//  LocationFunctions.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 15/08/2021.
//

import Foundation
import MapKit
import Alamofire

extension ViewController: CLLocationManagerDelegate {
     func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         if status == .authorizedWhenInUse{
             getLocation()
         } else {
             let alert = UIAlertController(title: "Error", message: "Please allow location access from your settings to continue using Will I Burn", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
             self.present(alert, animated: true, completion: nil)
         }
     }
     func getLocation() {
         if let loc = locationManager.location?.coordinate{
             coords = loc
         }
     }
    func getWeatherData () {
        let url = WeatherURL(lat: String(coords.latitude), long: String(coords.longitude)).getFullURL()
        let request = AF.request(url)
        request.responseDecodable(of: Main.self) { (response) in
            switch response.result {
            case .success(let main):
                let calculatedTime = self.calcBurnTime(main.data.weather[0].uvIndex)
                self.burnTime =  Double(String(format:"%.2f", calculatedTime))!.rounded(.down)
                self.minutesLabel.text = String(self.burnTime)
                self.spinner.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
