//
//  ViewController.swift
//  MyFirstApp
//
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    
    let message = ["You Are Awesome",
                   "You Are Great",
                   "You Are Fantastic",
                   "Fabulous? That's You!",
                   "How Are You Today",
                   "How mach" ]
    
    var imageNumber = 0
    var messageNumber = 0
    var totalNumberOfImage = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showBtn(_ sender: UIButton) {
        
        var newMessage = Int.random(in: 0...message.count-1)
        while messageNumber == newMessage {
            newMessage = Int.random(in: 0...message.count-1)
            print("messageNumber: \(messageNumber)")
//            myLabel.text = message[newMessage]
        }
        messageNumber = newMessage
     
        print("這裡當嗎")
        myLabel.text = message[messageNumber]
        var newImageView = Int.random(in: 0...totalNumberOfImage)
        while imageNumber == newImageView {
            newImageView = Int.random(in: 0...totalNumberOfImage)
        }
        imageNumber = newImageView
        myImageView.image = UIImage(named: "image\(newImageView)")
        
    }
    
}

