//
//  ReadCell.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/4/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

class ReadCell: UICollectionViewCell , UIScrollViewDelegate {
    
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var Cover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //scroll.delegate = self
        
        self.scroll.minimumZoomScale = 1.0
        self.scroll.maximumZoomScale = 8.0
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return Cover
    }

}
