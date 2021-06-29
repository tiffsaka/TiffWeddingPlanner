//
//  AccountViewController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = AccountViewModel()
    var selectedRow: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    

    // MARK: - Navigation

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        
        let identifier: String
        if indexPath.row == 0 {
            identifier = "toPlaceholderVC"
        } else {
            identifier = "toCollaboratorsVC"
        }
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if selectedRow == 0 {
//            if segue.identifier == "toPlaceholderVC" {
//                guard let indexPath = tableView.indexPathForSelectedRow,
//                      let destinationVC = segue.destination as? PlaceholderViewController else { return }
//            }
//        } else if selectedRow == 1 {
//            if segue.identifier == "toCollaboratorsVC" {
//                guard let indexPath = tableView.indexPathForSelectedRow,
//                      let destinationVC = segue.destination as? CollaboratorsViewController else { return }
//            }
//        }
    }
    
}


extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as? AccountTableViewCell else { return UITableViewCell() }
        
        let category = viewModel.getCategoryName(for: indexPath.row)
        cell.updateViews(for: indexPath.row)
        return cell
    }
    

}
