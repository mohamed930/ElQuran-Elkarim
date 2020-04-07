//
//  Quran Parts.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/4/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import CoreData

class Quran_Parts: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var pa = [PageNumber]()
    
    var x = 0
    
    private var PartsArray = ["001","002","003","004","005","006","007","008","009","P10","P11","P12","P13","P14","P15","P16","P17","P18","P19","P20","P21","P22","P23","P24","P25","P26","P27","P28","P29","P30"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "Parts", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.estimatedRowHeight = 94
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PartsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : Parts = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Parts
        
        cell.CoverImage.image = UIImage(named: PartsArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            setValue(val: 0)
            break
        case 1:
            setValue(val: 1)
            break
        case 2:
            setValue(val: 2)
            break
        case 3:
            setValue(val: 3)
            break
        case 4:
            setValue(val: 4)
            break
        case 5:
            setValue(val: 5)
            break
        default:
            print("No Any Cases!")
        }
        self.performSegue(withIdentifier: "Read", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func setValue (val:Int) {
        x = val
    }
    
    @IBAction func BTNContinue(_ sender: Any) {
        self.performSegue(withIdentifier: "History", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Read" {
            if let navController = segue.destination as? UINavigationController {
                if let childvc = navController.topViewController as? Quran {
                    childvc.Res = x
                }
            }
        }
    }
}
