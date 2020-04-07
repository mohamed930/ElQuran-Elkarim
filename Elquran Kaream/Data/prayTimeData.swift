//
//  prayTimeData.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/6/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import Foundation

class praytimedata {
    var Title = ""
    var Fajer = ""
    var SunRise = ""
    var Duher = ""
    var Aser = ""
    var Magreb = ""
    var Isha = ""
    
    init(Title: String , Fajer:String , SunRise:String , Duher:String , Aser:String , Magreb:String , Isha : String) {
        self.Title = Title
        self.Fajer = Fajer
        self.SunRise = SunRise
        self.Duher = Duher
        self.Aser = Aser
        self.Magreb = Magreb
        self.Isha = Isha
    }
}
