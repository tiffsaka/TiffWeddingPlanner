//
//  AccountViewModel.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import Foundation

class AccountViewModel {
        
    enum AccountCategories: String, CaseIterable {
        case personal = "Personal"
        case collaborators = "Collaborators"
        case wedding = "Wedding"
    }
    
    func getNumberOfRows() -> Int {
        return AccountCategories.allCases.count
    }
    
    func getCategoryName(for index: Int) -> String {
        return AccountCategories.allCases[index].rawValue
    }
    
    
}
