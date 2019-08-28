//
//  DEtailsContainerViewController.swift
//  Series
//
//  Created by julio vargas bautista on 8/28/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class DetailsContainerViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
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
        
        setupView()
    }
    private func setupView() {
        setupSegmentControl()
        updateView()
    }
    private func setupSegmentControl(){
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Summary", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Session", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDiidChanged(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc func selectionDiidChanged(sender: UISegmentedControl){
        updateView()
    }
    func updateView(){
        summaruViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 0)
        sessionViewController.view.isHidden = !(segmentedControl.selectedSegmentIndex == 1)
        
    }
    private func addChildViewControllers(childViewController: UIViewController)
    {
        
       // addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        childViewController.didMove(toParent: self)
    }
}
