//
//  Parts.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/4/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class Parts: UITableViewCell {
    
    @IBOutlet weak var CoverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
