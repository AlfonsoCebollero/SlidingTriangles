//
//  ViewController.swift
//  Examen1
//
//  Created by Marina Cebollero on 8/10/18.
//  Copyright © 2018 g818. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TriangleViewDatasource{
  
    
    @IBOutlet weak var sliderAncho: UISlider!
    @IBOutlet weak var triangle2: TriangleVIew!
    @IBOutlet weak var triangle1: TriangleVIew!
    
    var v: Double = 0.0{
        didSet{
            triangle1.setNeedsDisplay()
            triangle2.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triangle2.datasource = self
        triangle1.datasource = self
       sliderAncho.sendActions(for: .valueChanged)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateAncho(_ sender: UISlider) {
        v = Double(sender.value)
    }
    func ancho(_ tv: TriangleVIew) -> CGFloat {
        return CGFloat(v)
    }
    
    
}

