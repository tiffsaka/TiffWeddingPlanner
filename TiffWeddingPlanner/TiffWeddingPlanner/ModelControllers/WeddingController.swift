//
//  WeddingController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import Foundation
import Firebase

class WeddingController {
    
    let db = Firestore.firestore()
    var wedding: Wedding?
    static let shared = WeddingController()
    
    func createWedding(weddingName: String) {
//        guard let currentUser = UserController.shared.currentUser else {
//            return print("Error - no current user found when creating wedding")
//        }
        
//        let ownerString = currentUser.id
        
        let newWedding = Wedding(weddingName: weddingName)//, owner: ownerString)
        let newDocument = db.collection("wedding").document()
        try? newDocument.setData(from: newWedding)
    }
    
    func addUserToWedding(weddingID: String, userType: Wedding.UserType, userIDString: String) {
        fetchWedding(weddingID: weddingID) { (result) in
            switch result {
            case .success(var wedding):
                print("Wedding print in add user func: \(wedding)")
                
                switch userType {
                case .usersFullAccess:
                    if wedding.usersFullAccess?.append(userIDString) == nil {
                        wedding.usersFullAccess = [userIDString]
                    }
                case .usersEditor:
                    if wedding.usersEditor?.append(userIDString) == nil {
                        wedding.usersEditor = [userIDString]
                    }
                case .usersReadOnly:
                    if wedding.usersReadOnly?.append(userIDString) == nil {
                        wedding.usersReadOnly = [userIDString]
                    }
                }
                print("Print is the user added?: \(wedding)")
                self.updateWedding(wedding: wedding)
                print("Successfully added user to wedding")
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func fetchWedding(weddingID: String, completion: @escaping (Result<Wedding, Error>) -> Void) {
        let weddingRef = db.collection("wedding").document(weddingID)
        weddingRef.getDocument { document, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(.failure(error))
            } else {
                if let document = document {
                    do {
                        guard let wedding = try document.data(as: Wedding.self) else { return }
                        self.wedding = wedding
                        print(self.wedding) //for testing purposes
                        print("Sucessfully fetched wedding")
                        return completion(.success(wedding))
                    } catch {
                        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                        return completion(.failure(error))
                    }
                }
            }
        }
    }
    
    func updateWedding(wedding: Wedding) {
        if let id = wedding.id {
            let weddingRef = db.collection("wedding").document(id)
            do {
                try weddingRef.setData(from: wedding)
                print("Print from updateWedding func: \(wedding)")
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
}
