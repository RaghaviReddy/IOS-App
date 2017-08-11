//
//  FirstViewController.swift
//  AR Music
//
//  Created by Raghvi on 7/9/17.
//  Copyright © 2017 Raghavi. All rights reserved.
//

import UIKit
import AVFoundation

var songs:[String] = []

var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStuffed = false
var audioselectedpath:String=""
var selectedsong = 0

class FirstViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    var playlistname:String = ""
    
    @IBOutlet weak var myTableView1: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
            audioselectedpath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")!
            selectedsong = indexPath.row
            self.performSegue(withIdentifier: "playsong", sender: self)
            
    }
    
    var thisList = 0
    
    @IBOutlet weak var label: UILabel!
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
             songs.remove(at: indexPath.row)
            myTableView1.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = list[thisList]
        gettingSongName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gettingSongName()
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        songs.removeAll();
        do
        {
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songPath
            {
                var mySong = song.absoluteString
                
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                    
                }

            }
            myTableView1.reloadData()
            
        }
        catch
        {
            print("ERROR")
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playsong" {
            let nextScene = segue.destination as? FinalViewController
            nextScene?.audiopath = audioselectedpath
            nextScene?.thissongname = selectedsong
        }
    }


}
