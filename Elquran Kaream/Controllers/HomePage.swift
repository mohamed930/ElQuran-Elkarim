//
//  HomePage.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/4/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomePage: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    var CoverArray = ["Cover","pray time","adaia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(UINib(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: "Cell")

        // Do any additional setup after loading the view.
        collectionView.isPagingEnabled = true
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
    
        // Configure the cell
        cell.CoverImage.image = UIImage(named: CoverArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch(indexPath.row) {
            case 0:
                // GOTO The Moshaf
                self.performSegue(withIdentifier: "First", sender: self)
            break
            case 1:
                // GOTO The Pray Time
                self.performSegue(withIdentifier: "Time", sender: self)
            break
            case 2:
                // GOTO The Adaia
            break
        default:
            print("There is No Choocie")
        }
    }
}
