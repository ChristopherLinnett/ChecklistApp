//
//  CheckboxItem.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation

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

