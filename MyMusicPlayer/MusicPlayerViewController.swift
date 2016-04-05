//
//  MusicPlayerViewController.swift
//  MyMusicPlayer
//
//  Created by León Felipe Guevara Chávez on 2016-04-05.
//  Copyright © 2016 León Felipe Guevara Chávez. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var volume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play() {
        
    }
    
    @IBAction func pause() {
        
    }
    
    @IBAction func stop() {
        
    }

    @IBAction func changeVolume(sender: UISlider) {
        
    }
    
}
