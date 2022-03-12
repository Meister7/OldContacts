//
//  MainDocument.swift
//  Contacts
//
//  Created by Эмир Кармышев on 19/2/22.
//

import Foundation
import UIKit
import SnapKit

class SetUpDocument{
    
private  var defaults = UserDefaults.standard
    
static var shared = SetUpDocument()

var setUpContact: [ContactsModel]{
get{
    if let data = defaults.value(forKey: "setUpContact") as? Data{
       return try! PropertyListDecoder().decode([ContactsModel].self, from: data)
    }else{
        return [ContactsModel]()
    }
}
set{
    if let data = try? PropertyListEncoder().encode(newValue){
        defaults.set(data, forKey: "setUpContact")
    }
}
}
func saveContact(model: ContactsModel){
    let contact = ContactsModel(name: model.name!, firstName: model.name!,
        phoneNumber: model.phoneNumber!)
        setUpContact.insert(contact, at: 0)
    }
}

