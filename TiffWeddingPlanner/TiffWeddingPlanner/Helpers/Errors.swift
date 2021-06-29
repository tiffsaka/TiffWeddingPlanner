//
//  Errors.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import Foundation

enum WeddingError: LocalizedError {
    case noUserLoggedIn
    
    
    var errorDescription: String? {
        switch self {
        case .noUserLoggedIn:
            return "No user logged in."
        }
    }
    
}
