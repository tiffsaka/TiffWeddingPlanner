//
//  GuestController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/22/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


class GuestController {
    
    let db = Firestore.firestore()
    var guest: Wedding.Guest?
    
    func fetchAllGuests() {
        
    }
    
    func createGuest(name: String) {
        let newGuest = Wedding.Guest(name: name)
        //TIFFSAKA - Do we need to dive into wedding -> guest
        let newDocument = db.collection("guest").document()
        try? newDocument.setData(from: newGuest)
    }
    
    func updateGuest() {
        
    }
    
    func deleteGuest() {
        
        
    }
    
    
}




