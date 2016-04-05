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
    @IBOutlet weak var songPos: UISlider!
    
    var songName : String = "";
    private var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        songTitle.text = songName
        albumCover.image = UIImage(named: songName + ".jpg")
        
        let songURL = NSBundle.mainBundle().URLForResource(songName, withExtension: "mp3")
        do {
            try player = AVAudioPlayer(contentsOfURL: songURL!)
            volume.value = player.volume
            songPos.maximumValue = Float(player.duration)
            player.play()
        } catch {
            print("Could not load the requested song")
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(MusicPlayerViewController.updateSongPos), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play() {
        if !player.playing {
            player.play()
        }
    }
    
    @IBAction func pause() {
        if player.playing {
            player.pause()
        }
        
    }
    
    @IBAction func stop() {
        player.stop()
        player.currentTime = 0.0
        updateSongPos()
    }

    @IBAction func changeVolume(sender: UISlider) {
        player.volume = volume.value
    }
    
    @IBAction func changeSongPos() {
        player.currentTime = NSTimeInterval(songPos.value)
    }
    
    func updateSongPos() {
        songPos.value = Float(player.currentTime)
    }
}
