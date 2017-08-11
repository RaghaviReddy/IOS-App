//
//  FinalViewController.swift
//  AR Music
//
//  Created by Raghvi on 7/9/17.
//  Copyright © 2017 Raghavi. All rights reserved.
//

import UIKit
import AVFoundation

class FinalViewController: UIViewController {
    
    var audiopath:String=""
    var thissongname = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any)
    {
        if audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)
    {
        if audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any)
    {
        if thissongname != 0
        {
              playThis(thisOne: songs[thissongname-1])
              thissongname -= 1
              label.text = songs[thissongname]
        }
    }
    
    @IBAction func next(_ sender: Any)
    {
        if thissongname < songs.count-1         {
            playThis(thisOne: songs[thissongname+1])
            thissongname += 1
            label.text = songs[thissongname]
            
        }
    }
    
    @IBAction func slider(_ sender: UISlider)
    {
        if audioStuffed == true
        {
           audioPlayer.volume = sender.value
        }
    }
    
    func playThis(thisOne: String)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("Error")
        }
    }
    
    func playselected(thisOne: String)
    {
        do
        {
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: thisOne) as URL)
            audioPlayer.play()
        }
        catch
        {
            print("Error")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        playselected(thisOne: audiopath)
        label.text = songs[thissongname]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
