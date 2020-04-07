//
//  PrayTime.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/6/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SVProgressHUD

class PrayTime: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , CLLocationManagerDelegate , CityNameDelegat {
    
    @IBOutlet weak var BorderView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Varible Which used in the url
    var day : Int = 0
    var month:String?
    var year:String?
    
    var url = "http://api.aladhan.com/v1/calendar?"
    
    var Times = [praytimedata]()
    let location = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pray Time In Current Location"
        

        // Register cell classes
        self.collectionView.register(UINib(nibName: "PrayTimeCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.isPagingEnabled = true
        
        
        // Open GPS And Get The Location
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        location.requestWhenInUseAuthorization()
        location.startUpdatingLocation()
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func BTNCity(_ sender: Any) {
        self.performSegue(withIdentifier: "City", sender: self)
    }
    
    
    @IBAction func BTNNext(_ sender: Any) {
        x = x + 1
        if x != Times.count {
            print(x)
            collectionView.scrollToItem(at: IndexPath(item: x, section: 0), at: [], animated: true)
        }
        else if x == Times.count {
            x = 0
            collectionView.scrollToItem(at: IndexPath(item: x, section: 0), at: [], animated: true)
        }
    }
    
    @IBAction func BTNPrev(_ sender: Any) {
        x = x - 1
        if x < 0 {
            x = 0
            print(x)
            collectionView.scrollToItem(at: IndexPath(item: x, section: 0), at: [], animated: true)
        }
        else {
            print(x)
            collectionView.scrollToItem(at: IndexPath(item: x, section: 0), at: [], animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Times.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : PrayTimeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PrayTimeCell
        
        // Config The Cell
        cell.MakeCell(ob: Times[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: BorderView.frame.width, height: BorderView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    var x = 0
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            x = indexPath!.row
            print(x)
        }
    }
    
    // TODO: These Methods For GPS.
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let l = locations[locations.count - 1]
        if l.horizontalAccuracy > 0 {
            location.stopUpdatingLocation()
            location.delegate = nil
            
            print("Long = \(l.coordinate.longitude) latitude = \(l.coordinate.latitude)")
            
            let long = String(l.coordinate.longitude)
            let liti = String(l.coordinate.latitude)
            
            getCurrentData()
            
            let dictionary = ["latitude":liti,"longitude":long,"method":"2","month":month,"year":year] as! [String : String]
            getPrayTimeData(url: url, Attri: dictionary)
        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    // TODO: This Method For Network:
    func getPrayTimeData (url : String , Attri:[String:String]) {
        SVProgressHUD.show()
        Alamofire.request(url, method: .get, parameters: Attri).responseJSON {
            response in
            if response.result.isSuccess {
                print ("Sucess for getting data!")
                //print(JSON(response.result.value!))
                
                let value = JSON(response.result.value!)
                print(" The JSON Count : \(value["data"].count)")
                
                self.parseJSON(count: value["data"].count ,json:value)
            }
            else {
                print("Error \(response.result.error!)")
            }
        }
        
    }
    
    func parseJSON (count : Int,json:JSON) {
        
        Times.removeAll()
        
        for i in 0...(count - 1) {
            let x = json["data"][i]["date"]["readable"].string!
            let x1 = json["data"][i]["timings"]["Fajr"].string!
            let x2 = json["data"][i]["timings"]["Sunrise"].string!
            let x3 = json["data"][i]["timings"]["Dhuhr"].string!
            let x4 = json["data"][i]["timings"]["Asr"].string!
            let x5 = json["data"][i]["timings"]["Maghrib"].string!
            let x6 = json["data"][i]["timings"]["Isha"].string!
            
            let ob = praytimedata(Title: x,Fajer: x1, SunRise: x2, Duher: x3, Aser: x4, Magreb: x5, Isha: x6)
            Times.append(ob)
            collectionView.reloadData()
        }
        
        collectionView.scrollToItem(at: IndexPath(item: day - 1, section: 0), at: [], animated: false)
        SVProgressHUD.dismiss()
    }
    
    // TODO: Get Date
    func getCurrentData () {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        day = Int(components.day!)
        month = String(components.month!)
        year = String(components.year!)
    }
    
    func changeCityName(CityName: String ,Country: String) {
        let attribute = ["city":CityName,"country":Country,"method":"2","month":month!,"year":year!] as [String : String]
        
        let url1 = "http://api.aladhan.com/v1/calendarByCity?"
        
        self.navigationItem.title = "Pray Times in \(CityName)"
        
        getPrayTimeData(url: url1, Attri: attribute)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "City" {
            let vc = segue.destination as! CityName
            vc.Delegate = self
        }
    }
}
