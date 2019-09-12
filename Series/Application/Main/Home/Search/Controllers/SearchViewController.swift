//
//  SearchViewController.swift
//  Series
//
//  Created by SalvadorKano on 7/30/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
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
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.initialViewController()
        }
        
    }
    var viewModel = SearchViewModel()
    
    
    //Now we’ll create a restartTimer function that we’ll call every time we want to restart the clock:

    //This timer calls a hideControls function after 10 seconds. Let’s create the hideControls function:


    //Now call this resetTimer() in viewDidAppear:

   
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
      
        navigationTitle(self)
        viewModel.delegate = self
        viewModel.getdata()

    }
    
    @IBAction func search(_ sender: Any) {
       searchSerie()
        
    }
    func searchSerie()-> Void{
        viewModel.getdataByName(name: textValue.text ?? "") { (lista, error, succes) in
            guard let succes = succes else {return}
            if !succes{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                    self.viewModel = SearchViewModel()
                    self.reloadData()
                }))
                
                
                self.present(alert, animated: true)
            }
       
            
        }
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
        self.id = viewModel.item(at: indexPath).id
        self.seriesName = viewModel.item(at: indexPath).seriesName
        self.performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pass = segue.destination as? DetailsViewController else { return }
            pass.id = self.id
            pass.seriesName = self.seriesName
        }
    
    }

extension SearchViewController {
    
}
