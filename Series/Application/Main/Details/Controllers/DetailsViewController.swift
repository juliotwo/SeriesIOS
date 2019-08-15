//
//  DetailsViewController.swift
//  Series
//
//  Created by julio vargas bautista on 8/8/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
//
//    @IBOutlet weak var vistaDinamica: UIView!
//    @IBOutlet var animationsButtons: [UIButton]!
//    @IBOutlet weak var animationLayout: NSLayoutConstraint!
    @IBOutlet weak var serieTitle: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var seasonsView: UIView!
    @IBOutlet weak var actorsView: UIView!
    
    public var id:Int?
    public var seriesName:String?
    public let viewModel = DetailsViewModel()
    public var serie: DetailsSerieViewModel?
    public var actors: ActorsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "TextLogo")
        imageView.image = image
        navigationItem.titleView = imageView

        serieTitle.text = seriesName
        
       
        
        detailsView.alpha = 1
        seasonsView.alpha = 0
        actorsView.alpha = 0
        
    }
    
    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        print("myLeftSideBarButtonItemTapped")
    }
 
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            detailsView.alpha = 1
            seasonsView.alpha = 0
            actorsView.alpha = 0
        }
        if sender.selectedSegmentIndex == 1 {
            detailsView.alpha = 0
            seasonsView.alpha = 1
            actorsView.alpha = 0
        }
        if sender.selectedSegmentIndex == 2 {
            detailsView.alpha = 0
            seasonsView.alpha = 0
            actorsView.alpha = 1
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let pass = segue.destination as? SinopsisViewModel
        {
            viewModel.getDetailsSerie( id: self.id!) { (serie, error, succes) in
                pass.serie = serie
                self.serie = serie
            }
        }
        
        if let passActors = segue.destination as? ActorsViewController {
            passActors.id = self.id
        }
    }
}
