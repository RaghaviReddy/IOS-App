//
//  ViewController.swift
//  AR Music
//
//  Created by Raghvi on 7/9/17.
//  Copyright © 2017 Raghavi. All rights reserved.
//

import UIKit

   var list:[String] = ["Playlist1","Playlist2","Playlist3","Playlist4","Playlist5","Playlist6"]
   var selectedplaylist:String = ""



class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var thisList = 0
    
    var identities:[String] = ["Songs A","Songs B","Songs C","Songs D","Songs E","Songs F"]
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addItem(_ sender: Any)
    {
        if input.text != ""
        {
            list.append(input.text!)
            input.text = ""
            self.myTableView .reloadData()
        }
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedplaylist = list[indexPath.row]
        self.performSegue(withIdentifier: "playlistinfo", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        myTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playlistinfo" {
            let nextScene = segue.destination as? FirstViewController
            nextScene?.playlistname = selectedplaylist
        }
    }


}

