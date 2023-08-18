//
//  ViewController.swift
//  Slots_App
//
//  Created by Nilay KADİROĞULLARI on 14.07.2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var spinButton: UIButton!
    
    var timer : Timer?
    var slotImages = ["apple","brillant","crown","dolar", "hearth", "lemon", "melon", "ring", "seven", "strawberry"]
    var time = 0
    
    @IBAction func bringRandomFruit(_ sender: Any) {
        self.spinButton.isEnabled = false
        resultLabel.text = ""
        DispatchQueue.main.async {
            self.startGame()
        }
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ [weak self] _ in
            self?.images()
            self?.time += 1

            if self?.time == 4 {
                self?.gameOver()
                self?.spinButton.isEnabled = true
                self?.time = 0
            }
        }
    }
    
    func images() {
        
        let randomOne = slotImages.randomElement()!
        imageOne.image = UIImage(named: randomOne)
        
        let randomTwo = slotImages.randomElement()!
        imageTwo.image = UIImage(named: randomTwo)
        
        let randomThree = slotImages.randomElement()!
        imageThree?.image = UIImage(named: randomThree)
        
        if randomOne == randomTwo {
            imageThree.image = UIImage(named: randomOne )
        } else if randomTwo == randomThree {
            imageOne.image = UIImage(named: randomTwo )
        } else if randomOne == randomThree {
            imageTwo.image = UIImage(named: randomOne )
        }

    }
    
    func gameOver() {
            
        timer?.invalidate()
        timer = nil
            
        if imageOne.image == imageTwo.image && imageOne.image == imageThree.image {
            resultLabel.text = "TEBRİKLER KAZANDINIZ!!"
            resultLabel.textColor = UIColor.green
        } else {
            resultLabel.text = "KAYBETTİNİZ :("
            resultLabel.textColor = .red
        }
    }
}
