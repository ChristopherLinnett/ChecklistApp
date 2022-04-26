//
//  MasterListModel.swift
//  Checklist
//
//  Created by Christopher Linnett on 31/3/2022.
//

import Foundation

struct MasterListObject: Identifiable, Codable{
    var id = UUID()
    var checkListName:String
    var checkListContainer: [CheckBoxListItem]
    
    mutating func deleteListItem(atOffsets: IndexSet){
        self.checkListContainer.remove(atOffsets: atOffsets)
    }
}
