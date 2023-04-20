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
    
    @IBOutlet weak var showBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        audioPlayer.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func playSound(num: Int) {
        if let sound = NSDataAsset(name: "sound\(num)") {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.delegate = self
                audioPlayer.play()
                
                showBtnOutlet.isEnabled = false
                
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
// 因為當連續按btn 播放音效時,func playSound(num: Int) 這段會跑到 catch 這執行, 想解決這樣提
//所以就加上這段 delegate , 和 isEanble   讓按鈕呈現灰色(false)無法按,等音效播完 才能在案 但還沒完全解決,日後再看
extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        showBtnOutlet.isEnabled = true
    }
}
