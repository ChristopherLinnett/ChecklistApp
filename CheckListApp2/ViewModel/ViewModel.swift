//
//  ViewModel.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var mainList:totalFile
    @Published var resetStorage: [CheckBoxListItem] = []

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
    func resetChecks(index: Int){
        if mainList.file[index].checkListContainer.count > 0 {
            for i in 0...mainList.file[index].checkListContainer.count-1 {
                self.resetStorage.append(mainList.file[index].checkListContainer[i])
                self.mainList.file[index].checkListContainer[i].setFalse()
            }
        }
    }
    func undoReset(index: Int){
        if mainList.file[index].checkListContainer.count > 0 {
            for i in 0...self.resetStorage.count-1 {
                if resetStorage[i].itemChecked != mainList.file[index].checkListContainer[i].itemChecked {mainList.file[index].checkListContainer[i].toggleChecked()}
            }
        }
        self.resetStorage = []
    }
    func clearReset() {
        resetStorage = []
    }
}

