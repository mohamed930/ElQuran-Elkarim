//
//  History Reading.swift
//  Elquran Kaream
//
//  Created by Mohamed Ali on 3/5/20.
//  Copyright © 2020 Mohamed Ali. All rights reserved.
//

import UIKit
import CoreData

class History_Reading: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    var Arr = [""]
    var StopArr = [PageNumber]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView.register(UINib(nibName: "ReadCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        collectionView.isPagingEnabled = true

        // Do any additional setup after loading the view.
        ReadData()
        print(" The number of Page \(StopArr[0].no!)")
        print(" The number of Part \(StopArr[0].part!)")
        
        Arr.remove(at: 0)
        switch Int(StopArr[0].part!) {
        case 0:
                for i in 0...20{
                    Arr.append("\(i+1)")
                }
                collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        case 1:
            var d = 22
            for _ in 0...19{
                Arr.append("\(d)")
                d = d + 1
            }
            collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        case 2:
            var d = 42
            for _ in 0...20 {
                Arr.append("\(d)")
                d = d + 1
            }
            collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        case 3:
            Arr.append("621")
            var d = 63
            for _ in 0...18 {
                Arr.append("\(d)")
                d = d + 1
            }
            collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        case 4:
            var d = 82
            for _ in 0...19 {
                Arr.append("\(d)")
                d = d + 1
            }
            collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        case 5:
            var d = 102
            for _ in 0...19 {
                Arr.append("\(d)")
                d = d + 1
            }
            collectionView.scrollToItem(at: IndexPath(item: Int(StopArr[0].no!)!, section: 0), at: [], animated: false)
            break
        default:
            print("There is no Cases!")
        }
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Arr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ReadCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ReadCell
    
        // Configure the cell
        cell.Cover.image = UIImage(named: Arr[indexPath.row])
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func ReadData(){
        let fetchrequest:NSFetchRequest<PageNumber> = PageNumber.fetchRequest()
        do {
            self.StopArr = try! context.fetch(fetchrequest)
        }
    }
    
    @IBAction func BTNBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var x:Int?
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            let indexPath = collectionView.indexPath(for: cell)
            x = indexPath!.row
            print(x!)
        }
    }
    
    @IBAction func BTNBookMarks(_ sender: Any) {
        StopArr[0].setValue(String(self.x!), forKey: "no")
        let p = StopArr[0].part
        StopArr[0].setValue(p, forKey: "part")
        ad.saveContext()
        print("Updated Data successfully!")
    }
    
}
