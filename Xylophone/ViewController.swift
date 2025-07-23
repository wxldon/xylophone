//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playNote(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else {
            print("Could not find file")
            return}
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Could not play file")
        }
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playNote(note: sender.currentTitle!)
        
        sender.alpha = 0.5

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
}

