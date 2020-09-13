//
//  GameOverViewController.swift
//  Renk Oyunu
//
//  Created by Macbook Pro on 15.02.2017.
//  Copyright © 2017 Burak ERARSLAN. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = score?.description
    }
    
    @IBAction func tryAgainButton(_ sender: Any) {
        let VC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gamingVC") as? GameViewController
        self.navigationController?.pushViewController(VC!, animated: true)
    }
}
