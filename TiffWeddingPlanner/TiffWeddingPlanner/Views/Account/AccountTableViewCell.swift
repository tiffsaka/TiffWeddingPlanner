//
//  AccountTableViewCell.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/23/21.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    private let viewModel = AccountViewModel()

    func updateViews(for index: Int) {
        categoryLabel.text = viewModel.getCategoryName(for: index)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
