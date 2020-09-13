//
//  GameViewController.swift
//  Renk Oyunu
//
//  Created by Macbook Pro on 4.02.2017.
//  Copyright © 2017 Burak ERARSLAN. All rights reserved.
//
enum Answer {
    case right
    case wrong
}

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet weak var circularProgress: CircularProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var colorTitleLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var isSoundButton: UIButton!
    @IBOutlet weak var checkMarkButton: UIButton!
    @IBOutlet weak var crossMarkButton: UIButton!

    @IBOutlet weak var topViewConst: NSLayoutConstraint!
    
    var player = AVAudioPlayer()
    var timer:Timer?
    
    var second:Float = 16
    var score:Int = 0
    var titleIndex:Int!
    var colorIndex:Int!

    var isSound = true

    let itemList:[Item] = [Item(title: "MAVİ", color: .blue),Item(title: "SARI", color: .yellow),Item(title: "YEŞİL", color: .green),Item(title: "MOR", color: .purple),Item(title: "KIRMIZI", color: .red),Item(title: "SİYAH", color: .black),Item(title: "PEMBE", color: .systemPink),Item(title: "TURUNCU", color: .orange)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let target = DeviceType.unknown.currentDevice()
        
        if target == .iPhoneXsMaxXr || target == .iPhoneXXs {
            topViewConst.constant = 88
        }else{
            topViewConst.constant = 64
        }
        
        updateRandomIndexes()

        timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
        
        circularProgress.trackColor = .lightGray
        circularProgress.progressColor = UIColor(red: 0.98, green: 0.41, blue: 0.04, alpha: 1.00)
        
        DispatchQueue.main.async {
            self.checkMarkButton.circle()
            self.crossMarkButton.circle()
        }
    }

    @IBAction func popLandingPage(_ sender: UIButton) {
        timer?.invalidate()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func isSoundButtonAction(_ sender: UIButton) {
           
        if isSound {
            isSoundButton.setImage(#imageLiteral(resourceName: "volume_negatif"), for: .normal)
            isSound = !isSound
        }else{
            isSoundButton.setImage(#imageLiteral(resourceName: "volume_pozitif"), for: .normal)
            isSound = !isSound
        }
    }
       
    @IBAction func checkButtonAction(_ sender: UIButton) {
           
        if titleIndex == colorIndex {
            updateRandomIndexes()
            score += 1
            second += 0.5
            updateScoreLabel()
            playSound(answer: .right)

        } else{
            //game over
            playSound(answer: .wrong)
            timer?.invalidate()
            self.showGameOverVC()
        }
    }
       
    @IBAction func crossButtonAction(_ sender: UIButton) {
          
        if titleIndex != colorIndex {
            updateRandomIndexes()
            score += 1
            second += 0.5
            updateScoreLabel()
            playSound(answer: .right)
        } else {
            //game over
            playSound(answer: .wrong)
            timer?.invalidate()
            self.showGameOverVC()
        }
    }
    
    func showGameOverVC() {
        let VC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gameOverVC") as? GameOverViewController
        VC?.score = self.score
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    
    func playSound(answer:Answer) {
        if isSound {
            do {
                if answer == .right {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "rightSound", ofType: "mp3")!) as URL)
                    player.play()
                }else {
                    player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "wrongSound", ofType: "mp3")!) as URL)
                    player.play()
                }
            }
            catch let error {
                print(error)
            }
        }
    }
    
    func updateScoreLabel() {
        if score < 10 {
            scoreLabel.text = "Score: 0\(score)"
        }else{
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    func updateRandomIndexes() {
        titleIndex = Int(arc4random_uniform(UInt32(itemList.count)))
        if(titleIndex > 2){
            colorIndex = Int(arc4random_uniform(UInt32(titleIndex-2))) + 3
        }
        else{
            colorIndex = Int(arc4random_uniform(UInt32(titleIndex)))
        }
        
        colorTitleLabel.text = itemList[titleIndex].title
        colorView.backgroundColor = itemList[colorIndex].color
    }
    
    @objc func timerFunc(){

        if second <= 0.1
        {
            timer?.invalidate()
            self.showGameOverVC()
        }
        else{
            second -= 0.1
        
            if(second < 1){
                secondLabel.text = String(format: "%.1f", second)
            }else{
                secondLabel.text = String(format: "%.0f", second)
            }
            self.circularProgress.updateProgress(1-(self.second*0.0625))
        }
    }
}
