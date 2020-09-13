//
//  GradientView.swift
//  Renk Oyunu
//
//  Created by Macbook Pro on 3.02.2017.
//  Copyright © 2017 Burak ERARSLAN. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var FirstColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor: UIColor = UIColor.clear{
        didSet{
            updateView()
        }
    }
    override class var layerClass: AnyClass{
        get{
            return CAGradientLayer.self
        }
    }
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor]
        layer.locations = [0.5]
    }
}
