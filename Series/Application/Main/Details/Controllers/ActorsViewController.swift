//
//  ActorsViewController.swift
//  Series
//
//  Created by SalvadorKano on 8/14/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class ActorsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    public var id:Int?
    public var viewModel = ActorsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        print(id ?? 4444444444)
        print("aqui llego")
        viewModel.getData(id: id!)
//        viewModel.delegate = self
//        viewModel.getActors(id: id!) { (actors, error, success) in
        print("hola")
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("adios")
    }
    
//        viewModel.delegate = self
//        viewModel.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}

extension ActorsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.numberOfitems
         print(count)
        print("asdasdasdaasdadasd")
        return 20
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
        
        cell.backgroundColor = UIColor.blue
//
//        cell.backgroundColor = UIColor.cyan
//
//
//
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
//         get a reference to our storyboard cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
//
//         Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
//                cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
//
        return cell
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let count = viewModel.numberOfitems
//        tableView.backgroundView = count == 0 ? emptyStateView : nil
//        tableView.separatorStyle = count == 0 ? .none : .singleLine
//        return count
//}
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.items.count
//    }
//}
}

extension ActorsViewController: UICollectionViewDelegate{
    
}

//extension ActorsViewController: UICollectionViewLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let width = collectionView.bounds.width
////        let cellWidth = (width - 30) / 3 // compute your cell width
////        return CGSize(width: cellWidth, height: cellWidth / 0.6)
//    }
//}
