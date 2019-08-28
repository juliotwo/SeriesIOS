//
//  DetailsViewController.swift
//  Series
//
//  Created by julio vargas bautista on 8/8/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var serieTitle: UILabel!    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var seasonsView: UIView!
    @IBOutlet weak var actorsView: UIView!
    
    public var id:Int?
    public var seriesName:String?
    
   
    public var serie: DetailsSerieViewModel?
    public var actors: ActorsViewModel?
    public let viewModel = DetailsViewModel()
    lazy var summaruViewController : SummaryViewController = {
        let storyboard = UIStoryboard(name: "DetailsContainers", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        self.addChildViewControllers(childViewController: viewController)
        return viewController
        
    }()
    
    lazy var sessionViewController : SessionViewController = {
        let storyboard = UIStoryboard(name: "DetailsContainers", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SessionViewController") as! SessionViewController
        self.addChildViewControllers(childViewController: viewController)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationBackImage(self)
        navigationTitle(self)
        serieTitle.text = seriesName
        detailsView.alpha = 1
        seasonsView.alpha = 0
        actorsView.alpha = 0
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    private func addChildViewControllers(childViewController: UIViewController)
    {

        // addChild(childViewController)
        detailsView.addSubview(childViewController.view)
        childViewController.view.frame = detailsView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        childViewController.didMove(toParent: self)
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
        viewModel.getDetailsSerie( id: self.id!) { (serie, error, succes) in
            if let pass = segue.destination as? SinopsisViewController
            {
                pass.serie = serie
            }
            if let pass = segue.destination as? TemporadasViewController
            {
                pass.temp = serie?.sessions
                
                if(Int(pass.temp) != nil){
                    pass.viewModel = EpisodesViewModel(id:self.id!)
                }
                pass.id = self.id!
            }
        }
        if let passActors = segue.destination as? ActorsViewController {
            passActors.viewModel = ActorsViewModel(id: self.id!)
        }
    }
}
