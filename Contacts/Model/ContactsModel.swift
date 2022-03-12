//
//  ContactsModel.swift
//  Contacts
//
//  Created by Эмир Кармышев on 19/2/22.
//

import Foundation

class ContactsModel: Codable {
    var name: String? = nil
    var firstName: String? = nil
    var phoneNumber: String? = nil
    
    init(name: String, firstName: String, phoneNumber: String){
        self.name = name
        self.firstName = firstName
        self.phoneNumber = phoneNumber
    }
    init(name: String, phoneNumber: String){
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
