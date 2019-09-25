//
//  LaunchViewController.swift
//  Series
//
//  Created by julio vargas bautista on 9/25/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    let progresView:UIProgressView = UIProgressView(progressViewStyle: .bar)
    let progress = Progress(totalUnitCount: 15)
    override func loadView() {
        super.loadView()
        progresView.translatesAutoresizingMaskIntoConstraints = false
       progresView.trackTintColor = UIColor.lightGray
       progresView.tintColor = UIColor.blue
        let verticalConstraint = NSLayoutConstraint(item: progresView, attribute: .topMargin, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 60)
        let horizontalConstraint = NSLayoutConstraint(item: progresView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
         
        let widthConstraint = NSLayoutConstraint(item: progresView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width * 0.8)
        progresView.progressTintColor = UIColor.green
        view.addSubview(progresView)
        view.backgroundColor = UIColor.orange
       
        progresView.transform = progresView.transform.scaledBy(x: 1, y: 4)
        view.addConstraints([horizontalConstraint, verticalConstraint,widthConstraint])
       progresbarControl()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func progresbarControl(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                return
            }
            self.progress.completedUnitCount += 1
            let progressFloat = Float(self.progress.fractionCompleted)
            
            self.progresView.setProgress(progressFloat, animated: true)
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
