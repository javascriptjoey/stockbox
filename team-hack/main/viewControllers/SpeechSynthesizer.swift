//
//  SpeechSynthesizer.swift
//  team-hack
//
//  Created by Joey Essak on 5/23/21.
//

import UIKit
import Lottie
import AVFoundation
class SpeechSynthesizer: UIViewController {
    
    // MARK: Animation View
    @IBOutlet weak var animationView: AnimationView!

    
    // MARK: Label Reference
    @IBOutlet weak var textToVoiceLabel: UILabel!
    @IBOutlet weak var audioPlaybackLabel: UILabel!
    @IBOutlet weak var speechSynthesizerLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    // MARK: UItextField
    @IBOutlet weak var textField: UITextField!
    
    
    // MARK: Buttons
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playButton(_ sender: UIButton) {
        
        
    }
    
    let testButton = AnimatedButton()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        errorLabel.isHidden = true
        let jsonName = "robot"
        let animation = Animation.named(jsonName)
        animationView.animation = animation
        
        
        let newJsonName = "redButtonAnimation"
         
        self.hideKeyboardWhenTappedAround()
        
        
       // testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.frame = CGRect(x: 135, y: 425, width: 125, height: 125)
        testButton.animation = Animation.named(newJsonName)
        testButton.clipsToBounds = false
        testButton.setPlayRange(fromMarker: "touchDownStart", toMarker: "touchDownEnd", event: .touchDown)
        testButton.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpCancel", event: .touchUpOutside)
        testButton.setPlayRange(fromMarker: "touchDownEnd", toMarker: "touchUpEnd", event: .touchUpInside)
        testButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        view.addSubview(testButton)
    }
    
    @objc func buttonAction(_ sender:UIButton!) {
        animationView.play()
        var userText:String?{
            return textField.text
        }
        
        let utterance = AVSpeechUtterance(string: textField.text ?? "")
        utterance.rate = 0.35
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 3.0
        
        let voice = AVSpeechSynthesisVoice(language: "en-GB")
        
        utterance.voice = voice
        var synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)

      }
}
