//
//  TemporadasViewController.swift
//  Series
//
//  Created by SalvadorKano on 8/13/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class TemporadasViewController: UIViewController  {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items:[String] = []
    
    var temp: String!{
        didSet{
            setUpView()
        }
    }
    func setUpView(){
        let tempInt:Int = Int(temp!) ?? 0
        for index in 1...tempInt {
            items.append(String(index))
        }
       print(items)
        collectionView.reloadData()
    }



}

extension TemporadasViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = items.count
        
        return count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as? CellTempViewModel else{
            return UICollectionViewCell()
        }
        
       cell.LabelCell.text = items[indexPath.row]
        
        return cell
    }
    
}


//
//extension TemporadasViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //        iPhoneScreenSizes()
//        return CGSize(width: screenWidth * 0.23, height: screenHeight * 0.2)
//    }
//}

