//
//  MasterListModel.swift
//  Checklist
//
//  Created by Christopher Linnett on 31/3/2022.
//

import Foundation
///
///This Object refers to a checklist, it contains a unique ID, a name (checkListName) and an array of items within the list (checkListContainer)
///- Parameter checkListName: A string that contains the title of the checklist
///- Parameter checListContainer: An array container checkBoxListItems, which are the items within the checklists
///
struct MasterListObject: Identifiable, Codable{
    var id = UUID()
    var checkListName:String
    var checkListContainer: [CheckBoxListItem]
    
    mutating func deleteListItem(atOffsets: IndexSet){
        self.checkListContainer.remove(atOffsets: atOffsets)
    }
}
