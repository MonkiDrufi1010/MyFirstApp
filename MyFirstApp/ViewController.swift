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
    
    
    @IBAction func showBtn(_ sender: UIButton) {
        
        var newMessage: Int
       
        repeat {
            newMessage = Int.random(in: 0...message.count-1)
            print("messageNumber: \(messageNumber)")
            print("這裡當嗎")
           
        } while messageNumber == newMessage
        messageNumber = newMessage
        myLabel.text = message[messageNumber]
      
       
        var newImageView: Int
        repeat {
            newImageView = Int.random(in: 0...totalNumberOfImage)
            
        } while imageNumber == newImageView
        imageNumber = newImageView
        myImageView.image = UIImage(named: "image\(newImageView)")
        
        var newSoundPlayer: Int
        repeat {
            newSoundPlayer = Int.random(in: 0...totalNumberSound)
            
        } while soundNumber == newSoundPlayer
        
        soundNumber = newSoundPlayer
        playSound(num: soundNumber)
        
        
        
       
    }
    

    
    
}

