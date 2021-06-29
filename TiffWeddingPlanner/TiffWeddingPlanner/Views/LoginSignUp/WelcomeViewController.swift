//
//  WelcomeViewController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        //CREATE WEDDING TEST
        //WeddingController.shared.createWedding(weddingName: "Sally and Paul's Wedding")
        
        //UPDATE WEDDING TEST
//        let wedding = Wedding(id: "hbRnGAHO6thK515Cifdj", weddingName: "Travis & Kristin's Wedding", date: Date(), usersFullAccess: ["ABC"])
//        WeddingController.shared.updateWedding(wedding: wedding)
        
        //FETCH WEDDING TEST
//        WeddingController.shared.fetchWedding(weddingID: "hbRnGAHO6thK515Cifdj")
        
        //ADD USER TO WEDDING TEST
//        WeddingController.shared.addUserToWedding(weddingID: "hbRnGAHO6thK515Cifdj", userType: .usersFullAccess, userIDString: "k1f2cf3me1Uv743aKkkjFH5Z01O2")
    }
    
    func setupElements() {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }

}
