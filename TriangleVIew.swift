//
//  TriangleVIew.swift
//  Examen1
//
//  Created by Marina Cebollero on 8/10/18.
//  Copyright © 2018 g818. All rights reserved.
//

import UIKit
protocol TriangleViewDatasource: class{
    func ancho(_ tv: TriangleVIew) -> CGFloat
}

@IBDesignable
class TriangleVIew: UIView {
    weak var datasource: TriangleViewDatasource!
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let w = bounds.size.width
        let h = bounds.size.height
        let o = CGPoint(x: w/2, y: 0)
        path.move(to: o)
        path.addLine(to: CGPoint(x: w/2, y: 0))
        path.addLine(to: CGPoint(x: w/2-w/2*datasource.ancho(self), y: h))
        path.addLine(to: CGPoint(x: w/2+w/2*datasource.ancho(self), y: h))
        UIColor.red.setFill()
        path.fill()
        path.close()
        
    }
    

}
