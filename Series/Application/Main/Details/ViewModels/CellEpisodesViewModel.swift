//
//  CellEpisodesViewModel.swift
//  Series
//
//  Created by julio vargas bautista on 8/19/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class CellEpisodesViewModel: UITableViewCell {

    @IBOutlet weak var titleEpisode: UILabel!
    @IBOutlet weak var overviewEpisode: UITextView!
    @IBOutlet weak var imageEpisode: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: EpisodeSerieViewModel!{
        didSet{
            setUpView()
        }
    }
    func setUpView(){
//       titleEpisode.text = "Episodio" + String(viewModel.numberEpisode)
        titleEpisode.text = viewModel.episodeName
        overviewEpisode.text = viewModel.oveview
        imageEpisode.image = UIImage()
        if viewModel.image == "" {
            imageEpisode.image = UIImage(named: "EmptyState")
        }else {
            imageEpisode.load(url: URL(string: "https://www.thetvdb.com/banners/\(viewModel.image)")!)
        }
        
    }
}
