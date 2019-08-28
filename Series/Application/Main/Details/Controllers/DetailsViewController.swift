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
    @IBOutlet weak var segmetedControl: UISegmentedControl!
    public var id:Int?
    public var seriesName:String?
    
   
    public var serie: DetailsSerieViewModel?
    public var actors: ActorsViewModel?
    public let viewModel = DetailsViewModel()
    lazy var sinopsisViewController : SinopsisViewController = {
        let storyboard = UIStoryboard(name: "sinopsis", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "SinopsisViewController") as! SinopsisViewController
        self.addChildViewControllers(childViewController: viewController)
        viewModel.getDetailsSerie( id: self.id!) { (serie, error, succes) in
            
                viewController.serie = serie
        }
        return viewController
        
    }()
    
    lazy var tempsViewController : TemporadasViewController = {
        let storyboard = UIStoryboard(name: "Temporadas", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "TemporadasViewController") as! TemporadasViewController
        self.addChildViewControllers(childViewController: viewController)
        viewModel.getDetailsSerie( id: self.id!) { (serie, error, succes) in
            viewController.temp = serie?.sessions
            
            if(Int(viewController.temp) != nil){
                viewController.viewModel = EpisodesViewModel(id:self.id!)
            }
            viewController.id = self.id!
            
        }
        return viewController
    }()
    lazy var actorsViewController : ActorsViewController = {
        let storyboard = UIStoryboard(name: "Actors", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ActorsViewController") as! ActorsViewController
        self.addChildViewControllers(childViewController: viewController)
        viewController.viewModel = ActorsViewModel(id: self.id!)
        return viewController
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationBackImage(self)
        navigationTitle(self)
        serieTitle.text = seriesName
       
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    private func setupView() {
        setupSegmentControl()
        updateView()
    }
    private func setupSegmentControl(){
        segmetedControl.removeAllSegments()
        segmetedControl.insertSegment(withTitle: "Sinopsis", at: 0, animated: false)
        segmetedControl.insertSegment(withTitle: "Temporadas", at: 1, animated: false)
        segmetedControl.insertSegment(withTitle: "Actores", at: 2, animated: false)
        segmetedControl.addTarget(self, action: #selector(selectionDiidChanged(sender:)), for: .valueChanged)
        segmetedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDiidChanged(sender: UISegmentedControl){
        updateView()
    }
    func updateView(){
        sinopsisViewController.view.isHidden = !(segmetedControl.selectedSegmentIndex == 0)
        tempsViewController.view.isHidden = !(segmetedControl.selectedSegmentIndex == 1)
        actorsViewController.view.isHidden = !(segmetedControl.selectedSegmentIndex == 2)
        
    }
    private func addChildViewControllers(childViewController: UIViewController)
    {

        // addChild(childViewController)
        detailsView.addSubview(childViewController.view)
        childViewController.view.frame = detailsView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
        if let passActors = segue.destination as? ActorsViewController {
            passActors.viewModel = ActorsViewModel(id: self.id!)
        }
    }
}
