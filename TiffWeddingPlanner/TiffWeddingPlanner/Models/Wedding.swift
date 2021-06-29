//
//  Wedding.swift
//  WeddingPlanner
//
//  Created by Tiffany Sakaguchi on 6/21/21.
//

import Foundation
import FirebaseFirestoreSwift
import Contacts

struct Wedding: Codable {
    
    //other structs coming soon: Vendor, Registry
    
    struct Task: Identifiable, Codable {
        
        enum Category: String, Codable {
            case healthAndBeauty
            case flowersAndDecor
            case photoAndVideo
            case accessories
            case attire
            case jewelry
            case musicAndShow
            case ceremony
            case reception
            case transportation
            case accomidation
            case unassignedCategory
        }
        
        //"When working with nested types, it is not required to add an @DocumentID property: nested properties are a part of the Firestore document, and do not constitute a separate document. Hence, they do not need a document ID."
        @DocumentID var id: String?
        var title: String
        var notes: String
        var assignment: String          //User.id
        var status: Bool
        var category: Category
    }
    
    struct Guest: Identifiable, Codable {
        
        enum Group: String, Codable {
            case bridesmaid
            case groomsman
            case guestOfPerson1
            case guestOfPerson2
            case mutualGuest
        }
        
        //This may not be needed. See comment on line 33
        @DocumentID var id: String?
        var name: String
        var nameForInvitation: String?
        var numberInParty: Int?
        var numberOfChildren: Int?
//        var source: CNContact?
        var group: Group?
        var rsvpStatus: Bool = false
        var initationSent: Bool = false
        var address: String?
        var phoneNumber: String?
        var notes: String?
        //need mealForEach - allow user to create these?
    }
    
    enum UserType: String, Codable, CaseIterable {
        case usersFullAccess
        case usersEditor
        case usersReadOnly
    }
    
    @DocumentID var id: String?
    var weddingName: String
//    let owner: String?                  //User.id
    var date: Date?                  //Date/String?
 //   let weddingID: String?            //6-digit code for users to use to join a wedding
    var usersFullAccess: [String]?   //User.id
    var usersEditor: [String]?       //User.id
    var usersReadOnly: [String]?     //User.id
    var tasks: [Task]?
    var guests: [Guest]?
    
}
