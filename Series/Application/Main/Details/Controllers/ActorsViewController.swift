//
//  ActorsViewController.swift
//  Series
//
//  Created by SalvadorKano on 8/14/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.size.width
}
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.size.height
}
class ActorsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView
            else {
                return UIView()
        }
        return view
    }()
    
    public var estimateWidth = 160.0
    var cellMarginCell = 16.0
    public var viewModel:ActorsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    }



extension ActorsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel?.numberOfitems
        collectionView.backgroundView = count == nil ? emptyStateView : nil
        collectionView.backgroundView = count == 0 ? emptyStateView : nil

        return count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? CellViewModelCollectionViewCell else{
            return UICollectionViewCell()
        }
 
        let cellView = viewModel?.item(at: indexPath)
        cell.viewModel = cellView
        
        return cell
    }

}

    

//extension ActorsViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        iPhoneScreenSizes()
//        return CGSize(width: screenWidth * 0.23, height: screenHeight * 0.2)
//    }
//}

extension ActorsViewController: ActorsViewModelDelegate{
    func reloadData() {
        
        collectionView.reloadData()
        
    }

}
extension ActorsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widtf = self.view.frame.width * 0.45
        return CGSize(width: widtf, height: 150 )
    }
}

//func iPhoneScreenSizes(){
//    let bounds = UIScreen.main.bounds
//    let height = bounds.size.height
//
//    switch height {
//    case 480.0:
//        print("iPhone 3,4")
//    case 568.0:
//        print("iPhone 5")
//    case 667.0:
//        print("iPhone 6")
//    case 736.0:
//        print("iPhone 6+")
//
//    default:
//        print("not an iPhone")
//
//    }
//}
