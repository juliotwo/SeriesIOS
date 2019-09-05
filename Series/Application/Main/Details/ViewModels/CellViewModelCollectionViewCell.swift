//
//  CellViewModelCollectionViewCell.swift
//  Series
//
//  Created by SalvadorKano on 8/14/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellViewModelCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var viewModel: DetailsActorViewModel! {
        didSet{
            setUpView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView(){
        name.text = viewModel.name
        image.image = UIImage()
        if viewModel.image == "" {
            image.image = UIImage(named: "EmptyState")
        } else {
            image.load(url: URL(string: "https://www.thetvdb.com/banners/\(viewModel.image)")!)
        }
        
    }
}
