//
//  totalFileModel.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation

struct totalFile {
    var file: [MasterListObject]
    
    mutating func save(){
        
    }
    
    mutating func load(){
        
    }
    mutating func addNewList(){
        self.file.insert(MasterListObject(checkListName: "Checklist", checkListContainer: []), at: 0)
    }
    mutating func deleteChecklist(atOffsets: IndexSet){
        self.file.remove(atOffsets: atOffsets)
    }
    
    mutating func rename(newName:String,index:Int) {
        if newName == "" {return}
        if newName == self.file[index].checkListName {return}
        self.file[index].checkListName = newName
    }
    mutating func addObject(newItemName:String, index: Int) {
        if newItemName == "" {return}
        self.file[index].checkListContainer.insert(CheckBoxListItem(itemName:newItemName), at:0)
    }
    
    
}
