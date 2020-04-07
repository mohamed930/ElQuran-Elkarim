//
//  HistoryQuran.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/5/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HistoryQuran: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var Array = [""]
    var bookPart = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView.register(UINib(nibName: "ReadCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        if bookPart == 1 {
            for i in 0...20{
                Array.append("\(i+1)")
            }
        }

        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ReadCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ReadCell
    
        // Configure the cell
        cell.Cover.image = UIImage(named: Array[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
