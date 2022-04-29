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
    @Published var isLoading:Bool = true

    init() {
        self.mainList = totalFile(file: [])
        self.populate()
    }
    
    func populate() {
        let workingFile = mainList.load()
        for i in 0..<workingFile.count {
            self.mainList.file.append(workingFile[i])
        }
        self.isLoading = false
        self.mainList.isLoading = false
    }
    func OnAddNewList() {
        self.mainList.addNewList()
    }
    func deleteChecklist(at offsets: IndexSet) {
        self.mainList.deleteChecklist(atOffsets: offsets)
    }
    func doMove(from source: IndexSet, to destination: Int){
        self.mainList.file.move(fromOffsets: source, toOffset: destination)
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

