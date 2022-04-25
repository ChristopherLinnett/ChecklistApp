//
//  ViewModel.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation

class ViewModel: ObservableObject {

    @Published var mainList:totalFile
        
    init() {
        self.mainList = totalFile(file: [])
        self.mainList.load()
    }
    func OnAddNewList() {
        self.mainList.addNewList()
    }
    func deleteChecklist(at offsets: IndexSet) {
        self.mainList.deleteChecklist(atOffsets: offsets)
    }
    func updateName(newName: String, index:Int) {
        self.mainList.rename(newName: newName,index: index)
    }
    func addListItem(itemName: String, index: Int) {
        self.mainList.addObject(newItemName: itemName, index: index)
    }
}

