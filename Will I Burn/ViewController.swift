//
//  ViewController.swift
//  Will I Burn
//
//  Created by Yasmine Ashraf on 15/08/2021.
//

import UIKit
import MapKit
import UserNotifications

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    var coords = CLLocationCoordinate2D(latitude: 40, longitude: 40)
    var skinType = SkinType().type1{
        didSet {
            skinTypeLabel.text = "Skin Type: " + self.skinType
            UserDefFunctions().setSkinType(value: skinType)
            getWeatherData()
        }
    }
    var burnTime: Double = 10.0
    @IBOutlet weak var skinTypeLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet var spinner:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        skinType = UserDefFunctions().getSkinType()
        skinTypeLabel.text = "Skin Type: " + skinType
    }
    @IBAction func reminderClicked(_ sender: UIButton) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted{
                let content = UNMutableNotificationContent()
                content.title = NSString.localizedUserNotificationString(forKey: "Time's Up!", arguments: nil)
                content.body = NSString.localizedUserNotificationString(forKey: "You are beginning to burn! Please apply sunblock or move to a shaded area", arguments: nil)
                content.sound = UNNotificationSound.default
                let timer = Double(self.burnTime)*60
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timer, repeats: false)
                let request = UNNotificationRequest(identifier: "willBurnIdentifier", content: content, trigger: trigger)
                center.add(request)
                }
            }
        }
    
    @IBAction func changeClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Skin Type", message: "Please choose your skin type", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: SkinType().type1, style: .default, handler: { (action) in
            self.skinType = SkinType().type1
        }))
        alert.addAction(UIAlertAction(title: SkinType().type2, style: .default, handler: { (action) in
            self.skinType = SkinType().type2
        }))
        alert.addAction(UIAlertAction(title: SkinType().type3, style: .default, handler: { (action) in
            self.skinType = SkinType().type3
        }))
        alert.addAction(UIAlertAction(title: SkinType().type4, style: .default, handler: { (action) in
            self.skinType = SkinType().type4
        }))
        alert.addAction(UIAlertAction(title: SkinType().type5, style: .default, handler: { (action) in
            self.skinType = SkinType().type5
        }))
        alert.addAction(UIAlertAction(title: SkinType().type6, style: .default, handler: { (action) in
            self.skinType = SkinType().type6
        }))
        self.present(alert, animated: true, completion: nil)
    }
   
    
    
}
