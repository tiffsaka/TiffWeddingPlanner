//
//  CollaboratorsViewModel.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/24/21.
//

import Foundation


class CollaboratorsViewModel {
    
    
    func generateInviteCode() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
          return String((0..<6).map{ _ in letters.randomElement()! })
    }
    
    
}
