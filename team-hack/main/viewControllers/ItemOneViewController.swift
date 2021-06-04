//
//  ItemOneViewController.swift
//  team-hack
//
//  Created by Joey Essak on 5/20/21.
//

import UIKit
import Lottie

class ItemOneViewController: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let jsonName = "48120-made-with-lottie-animated-text"
        let animation = Animation.named(jsonName)
        animationView.animation = animation
        animationView.play()
        
    }
    

   

}
