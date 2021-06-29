//
//  CollaboratorsDetailViewController.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/24/21.
//

import UIKit

class CollaboratorsDetailViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var inviteCodeTextField: UITextField!
    @IBOutlet weak var permissionStatusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var generateCodeButton: UIButton!
    @IBOutlet weak var codeCopiedLabel: UILabel!
    
    private let viewModel = CollaboratorsViewModel()
    var inviteCode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inviteCodeTextField.isUserInteractionEnabled = false
        if let text = inviteCodeTextField.text, !text.isEmpty {
            generateCodeButton.isUserInteractionEnabled = false
        }
        codeCopiedLabel.alpha = 0
    }
    

    
    @IBAction func generateCodeButtonTapped(_ sender: Any) {
        inviteCode = viewModel.generateInviteCode()
        inviteCodeTextField.text = inviteCode
        codeCopiedLabel.alpha = 1
    }
    
    @IBAction func copyCodeButtonTapped(_ sender: Any) {
        UIPasteboard.general.string = inviteCode
        print("Copy button tapped.")
        codeCopiedLabel.alpha = 1
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty else { return }
        var permission: String
        switch permissionStatusSegmentedControl.selectedSegmentIndex {
            case 0: permission = "fullAccess" ;
            case 1: permission = "editor";
            case 2: permission = "readOnly"
            default: break
        }
        
//        UserController.shared.createUser(firstName: firstName, lastName: lastName, uid: <#T##String#>)
//        
//        WeddingController.shared.addUserToWedding(weddingID: <#T##String#>, userType: <#T##Wedding.UserType#>, userIDString: <#T##String#>)
//        
        navigationController?.popViewController(animated: true)
        
    }
    

}
