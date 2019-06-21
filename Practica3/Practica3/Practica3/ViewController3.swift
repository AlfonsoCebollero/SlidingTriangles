//
//  ViewController3.swift
//  Practica3
//
//  Created by Marina Cebollero on 31/10/18.
//  Copyright © 2018 g818. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loveDate: UIDatePicker!
    var currentDate = Date()
    @IBAction func enterLoveDate(_ sender: Any) {}
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewController
        controller.loveDate = loveDate.date
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let love = defaults.object(forKey: "love") as? Date{
            loveDate.date = love
        }
        else{
            loveDate.date = Date()
        }
        label.text = "Introduce your love date"
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        defaults.set(loveDate.date, forKey: "love")
    }
    


}
