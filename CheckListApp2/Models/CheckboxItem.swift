//
//  CheckboxItem.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation
///
///This Object refers to an item that exists within a checklist, it contains a name (itemName) and a true/false value that will determine whether the visual item will have a tick attached (itemChecked)
///- Parameter checkListName: A string that contains the title of the object within a checklist
///- Parameter itemChecked: A true/false value that will determine whether or not the visual item will have a tick attached to it
///
struct CheckBoxListItem : Identifiable, Codable {
    var id = UUID()
    var itemName : String
    var itemChecked : Bool = false
    
    mutating func toggleChecked() {              //allows individual checkbox to be checked/unchecked when clicked
        self.itemChecked.toggle()
    }
    mutating func setFalse() {                   //allows resetting of checkmarks for reset function
        self.itemChecked = false
    }
}

