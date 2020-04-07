//
//  PrayTimeCell.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/6/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class PrayTimeCell: UICollectionViewCell {
    
    @IBOutlet weak var TXTFajerTime: UILabel!
    @IBOutlet weak var TXTSumRiseTime: UILabel!
    @IBOutlet weak var TXTDuherTime: UILabel!
    @IBOutlet weak var TXTAserTime: UILabel!
    @IBOutlet weak var TXTMagribTime: UILabel!
    @IBOutlet weak var TXTIshaTime: UILabel!
    @IBOutlet weak var TXTTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func MakeCell (ob:praytimedata) {
        TXTTitle.text = "Pray Times For \(ob.Title)"
        TXTFajerTime.text = ob.Fajer
        TXTSumRiseTime.text = ob.SunRise
        TXTDuherTime.text = ob.Duher
        TXTAserTime.text = ob.Aser
        TXTMagribTime.text = ob.Magreb
        TXTIshaTime.text = ob.Isha
    }

}
