//
//  ViewController.swift
//  MyFirstApp
//
//
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    
    let message = ["You Are Awesome",
                   "You Are Great",
                   "You Are Fantastic",
                   "Fabulous? That's You!",
                   "How Are You Today",
                   "How mach" ]
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    var totalNumberSound = 6
    var totalNumberOfImage = 9
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(num: Int) {
        if let sound = NSDataAsset(name: "sound\(num)") {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }else {
            print("error haha")
        }
        
    }
    
    func nonRepeatingRandom(orinigal: Int, uppperLimit: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...uppperLimit)
        } while orinigal == newNumber
        
        return newNumber
    }
    
    
    
    @IBAction func showBtn(_ sender: UIButton) {
        
        messageNumber = nonRepeatingRandom(orinigal: messageNumber, uppperLimit: message.count-1)
        myLabel.text = message[messageNumber]
      
       
        imageNumber = nonRepeatingRandom(orinigal: imageNumber, uppperLimit: totalNumberOfImage)
        myImageView.image = UIImage(named: "image\(imageNumber)")
        
     
        
        soundNumber = nonRepeatingRandom(orinigal: soundNumber, uppperLimit: totalNumberSound)
      
//        playSound(num: soundNumber)
        
        if playSoundSwitch.isOn {
            playSound(num: soundNumber)
        }

       
    }
  

    
    @IBAction func playSoundToggle(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil{
            audioPlayer.stop()
            
        }
        
    }
    
    

    
    
}

