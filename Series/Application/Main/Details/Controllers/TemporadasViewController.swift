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
    
    @IBOutlet weak var tableView: UITableView!
    var selectedSeason: Int = 1
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView
            else {
                return UIView()
        }
        return view
    }()
    
    var viewModel:EpisodesViewModel!{
        didSet{
            setUpView2()
        }
    }
    var id: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        // Do any additional setup after loading the view.
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        viewModel.getdata(id: self.id!, airedSeason: String(self.selectedSeason)){ (lista, error, succes) in
            print("Succes in refrsh")
        }
        collectionView.reloadData()
        refreshControl.endRefreshing()
    }
    var items:[String] = []
    
    var temp: String!{
        didSet{
            setUpView()
        }
    }
    func setUpView(){
        let tempInt:Int = Int(temp!) ?? 0
        if(tempInt != 0){
            for index in 1...tempInt {
                items.append(String(index))
            }
            print(items)
            collectionView.reloadData()
        
        }
        
    }
    func setUpView2(){
    
        viewModel.delegate = self
    }


}

extension TemporadasViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print(destinationIndexPath)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = items.count
        
        return count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath as IndexPath) as? CellTempViewModel else{
            return UICollectionViewCell()
        }
        if indexPath.row + 1 == selectedSeason{
        cell.backgroundColor = .orange
        }
        else{
            cell.backgroundColor = .white
        }
       cell.LabelCell.text = items[indexPath.row]
        
        return cell
    }

    
}
extension TemporadasViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getdata(id: self.id!, airedSeason: String(indexPath.row + 1)){ (lista, error, succes) in
            print("Succes in view controller")
        }
        self.selectedSeason = indexPath.row + 1
        collectionView.reloadData()
    }
    
}
extension TemporadasViewController:EpisodeshViewModelDelegate{
    func reloadData() {
        tableView.reloadData()
    }
}


extension TemporadasViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel?.numberOfitems
        
        
        tableView.backgroundView = count == nil ? emptyStateView : nil
        tableView.separatorStyle = count == nil ? .none : .singleLine
        return count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellEpisodes", for: indexPath) as? CellEpisodesViewModel else{
            return UITableViewCell()
        }
        cell.viewModel = viewModel?.item(at: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }

    
}


//
//extension TemporadasViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //        iPhoneScreenSizes()
//        return CGSize(width: screenWidth * 0.23, height: screenHeight * 0.2)
//    }
//}

