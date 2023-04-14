//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 謝榮駿 on 2023/4/13.
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showBtn(_ sender: UIButton) {
        
        myLabel.text = message[Int.random(in: 0...message.count - 1)]
        
        myImageView.image = UIImage(named: "image\(Int.random(in: 0...9))")
        
    }
    
}

