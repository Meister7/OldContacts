//
//  MainDocument.swift
//  Contacts
//
//  Created by Эмир Кармышев on 19/2/22.


import Foundation
import UIKit
import SnapKit
class MainDocument: UIViewController  {
    
    private  var dataBase = UserDefaults.standard

    var contactArray: [ContactsModel] = SetUpDocument.shared.setUpContact

      func saveContact(model: ContactsModel) {
          SetUpDocument.shared.saveContact(model: model)
      }

      func getContact() -> [ContactsModel]{
          return SetUpDocument.shared.setUpContact
      }
}
