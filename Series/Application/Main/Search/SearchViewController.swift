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
    @IBOutlet weak var textValue: UITextField!
    @IBOutlet weak var buttonCerrar: UIBarButtonItem!
    
    private var id: Int?
    private var seriesName: String?
    
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
//        self.performSegue(withIdentifier: "GoToLogin", sender: self)

      
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.initialViewController()
    }
    var viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "TextLogo")
        imageView.image = image
        navigationItem.titleView = imageView
        buttonCerrar.isEnabled = true
        viewModel.delegate = self
        viewModel.getdata()

    }
    
    @IBAction func search(_ sender: Any) {
        viewModel.getdataByName(name: textValue.text ?? "")
        
    }
    
}
extension SearchViewController :  SearchViewModelDelegate{
    func reloadData() {
        
        tableView.reloadData()

    }
}
extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.numberOfitems
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellSearchViewModel else{
            return UITableViewCell()
        }
        cell.viewModel = viewModel.item(at: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( indexPath.row)
        print("hola")
        self.id = viewModel.item(at: indexPath).id
        self.seriesName = viewModel.item(at: indexPath).seriesName
        print(self.id ?? 8)
        
        
        self.performSegue(withIdentifier: "DetailsContainer", sender: self)
        
      
       
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? DetailsViewController else { return }
            pass.id = self.id
            pass.seriesName = self.seriesName
//        if segue.identifier == "GoToDetails" {
//            print(segue.destination)
        
        }
    }

