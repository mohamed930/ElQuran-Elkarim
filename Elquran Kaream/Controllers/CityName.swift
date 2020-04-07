//
//  CityName.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/7/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

protocol CityNameDelegat {
    func changeCityName(CityName:String , Country: String)
}

class CityName: UIViewController {
    
    
    @IBOutlet weak var TXTCityName: UITextField!
    @IBOutlet weak var TXTCountry: UITextField!
    
    
    var Delegate : CityNameDelegat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BTNGo(_ sender: Any) {
        
        Delegate?.changeCityName(CityName: TXTCityName.text!,Country: TXTCountry.text!)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
