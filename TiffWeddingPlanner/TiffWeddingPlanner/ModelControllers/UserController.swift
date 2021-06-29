//
//  UserController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift


class UserController {
    
    static let shared = UserController()
    var currentUser: User?
    var user: User?
    
    let db = Firestore.firestore()
    
    //MARK: - CRUD Functions
    
    //TIFFSAKA - This is placeholder function only, please update/replace
    func createUser(firstName: String, lastName: String, uid: String) {
        let documentRef = db.collection("users").document(uid)
        documentRef.setData(["firstname" : firstName, "lastname" : lastName, "uid" : uid])
        print("User created successfully: \(uid)")
    }
    
//    func checkIfUserIsLoggedIn() {
//        if Auth.auth().currentUser?.uid == nil {
//            performSelector(#selector(handleLogout))
//        }
//    }
    
//    func handleLogout() {
//        do {
//            try Auth.auth().signOut()
//        } catch let logoutError {
//            print(logoutError)
//        }
//
//        let welcomeViewController = WelcomeViewController()
//
//        present(welcomeViewController, animated: true, completion: nil)
//    }
    
    
}
