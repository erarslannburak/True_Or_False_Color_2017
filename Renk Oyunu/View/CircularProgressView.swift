//
//  CircularProgressView.swift
//  Renk Oyunu
//
//  Created by Burak Erarslan on 13.09.2020.
//  Copyright © 2020 Burak ERARSLAN. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {
  
    var progressLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DispatchQueue.main.async {
            self.makeCircularPath()
        }
    }
    
    var progressColor:UIColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor:UIColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    func makeCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 5.0
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 5
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func updateProgress(_ value: Float) {
        progressLayer.strokeEnd = CGFloat(value)
    }
}
