//
//  ViewController.swift
//  Practica3
//
//  Created by Marina Cebollero on 31/10/18.
//  Copyright © 2018 g818. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var birthDate = Date()
    var loveDate = Date()
    var currentDate = Date()
    
    @IBOutlet weak var date1: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBAction func calculatePartyDate(_ sender: Any) {
        
        if birthDate.compare(loveDate) == ComparisonResult.orderedDescending{
            createAlert(title: "WARNING", message: "You can not fall in love if you were not born")
            label.text = "Check your selected dates"
        }
        else if birthDate.timeIntervalSince1970 > currentDate.timeIntervalSince1970{
            createAlert(title: "WARNING", message: "You can not be born in the future")
            label.text = "Check your selected dates"
        }
        else if loveDate.timeIntervalSince1970 > currentDate.timeIntervalSince1970{
            createAlert(title: "WARNING", message: "You can not fall in love in the future")
            label.text = "Check your selected dates"
        }
        else{
            let time = loveDate.timeIntervalSince(birthDate)
            let orangeDate = Date.init(timeInterval: time, since: loveDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "eng_GB")
            let a = dateFormatter.string(from: orangeDate)
            label.text = "\(a)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        if let birth = defaults.object(forKey: "birth") as? Date{
            birthDate = birth
        }
        else{
            birthDate = Date()
        }
        if let love = defaults.object(forKey: "birth") as? Date{
            loveDate = love
        }
        else{
            loveDate = Date()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAlert (title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: {(action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(birthDate, forKey: "birth")
        defaults.set(loveDate, forKey: "love")
    }
    
    @IBAction func unwindToOne(_ sender: UIStoryboardSegue){}
}

