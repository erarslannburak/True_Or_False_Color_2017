//
//  LandingViewController.swift
//  Renk Oyunu
//
//  Created by Macbook Pro on 3.02.2017.
//  Copyright © 2017 Burak ERARSLAN. All rights reserved.
//

import UIKit


class LandingViewController: UIViewController {

    @IBOutlet weak var blurView:UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var start: UIButton!
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start.cornerRadius(radius: 28)
        start.border(color: .white, width: 3)
        blurView.blur(style: .dark)
    }
    
    @IBAction func startAction(_ sender: Any) {
        let VC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gamingVC") as? GameViewController
        self.navigationController?.pushViewController(VC!, animated: true)
        
    }
}

