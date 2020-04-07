//
//  Quran.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/4/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import CoreData

class Quran: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var Res = 0
    var PageArray = [PageNumber]()
    
    var Array = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.register(UINib(nibName: "ReadCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.isPagingEnabled = true

        // Do any additional setup after loading the view.
        Array.remove(at: 0)
        switch Res {
        case 0:
            for i in 0...20{
                Array.append("\(i+1)")
            }
            break
        case 1:
            var d = 22
            for _ in 0...19{
                Array.append("\(d)")
                d = d + 1
            }
            break
        case 2:
            var d = 42
            for _ in 0...20 {
                Array.append("\(d)")
                d = d + 1
            }
            break
        case 3:
            Array.append("621")
            var d = 63
            for _ in 0...18 {
                Array.append("\(d)")
                d = d + 1
            }
            break
        case 4:
            var d = 82
            for _ in 0...19 {
                Array.append("\(d)")
                d = d + 1
            }
            break
        case 5:
            var d = 102
            for _ in 0...19 {
                Array.append("\(d)")
                d = d + 1
            }
            break
        default:
            print("There is no Cases")
        }
        ReadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
    
    var x:Int?
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            x = indexPath!.row
            print(x!)
        }
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func BTNBookMarks(_ sender: Any) {
        setData()
    }
    
    
    func ReadData (){
        let fetchrequest:NSFetchRequest<PageNumber> = PageNumber.fetchRequest()
        do {
            self.PageArray = try! context.fetch(fetchrequest)
        }
    }
    
    func setData() {
        if PageArray[0].no == nil {
            let ob = PageNumber(context: context)
            ob.no = String(self.x!)
            ob.part = String(self.Res)
            ad.saveContext()
            print("Data Saved successfully!")
        }
        else {
            PageArray[0].setValue(String(self.x!), forKey: "no")
            PageArray[0].setValue(String(self.Res), forKey: "part")
            ad.saveContext()
            print("Updated Data successfully!")
        }
    }
}
