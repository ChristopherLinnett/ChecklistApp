//
//  ListItemModel.swift
//  Checklist
//
//  Created by Christopher Linnett on 23/3/2022.
//

import Foundation

struct CheckBoxListItem : Identifiable {
    var id = UUID()
    var itemName : String
    var itemChecked : Bool
    
    mutating func toggleChecked() {              //allows individual checkbox to be checked/unchecked when clicked
        self.itemChecked.toggle()
    }
    mutating func renameItem (newName: String) { //allows renaming for editing functions
        self.itemName = newName
    }
    mutating func setFalse() {                   //allows resetting of checkmarks for reset function
        self.itemChecked = false
    }

}

