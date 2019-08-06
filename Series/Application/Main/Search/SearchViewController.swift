//
//  SearchViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/30/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView
            else {
                return UIView()
        }
        return view
    }()
    
    @IBAction func cerrarSesion(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "session")
        UserDefaults.standard.set(nil, forKey: "token")

        let name = "Login"
        let viewController = UIStoryboard(name: name, bundle: Bundle.main).instantiateInitialViewController()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 5
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}
