//
//  ViewController.swift
//  Practica3
//
//  Created by Marina Cebollero on 31/10/18.
//  Copyright © 2018 g818. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var birthDate: UIDatePicker!
    var currentDate = Date()
    @IBAction func enterBirthDate(_ sender: Any) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let birth = defaults.object(forKey: "birth") as? Date{
            birthDate.date = birth
        }
        else{
            birthDate.date = Date()
        label.text = "Introduce your birth date"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewController
        controller.birthDate = birthDate.date
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(birthDate.date, forKey: "birth")
    }

    
}
