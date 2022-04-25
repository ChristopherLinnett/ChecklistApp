//
//  ListDetailView.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import SwiftUI
struct ListDetailView: View {
    @ObservedObject var checklist: ViewModel
    var selfIndex:Int
    @State var newItem:String = ""
    @State var title:String = ""
    @Environment(\.editMode) var editMode
    
    init(checklist: ViewModel, selfIndex:Int) {
        self.checklist = checklist
        self.selfIndex = selfIndex

        
    }
    
    var body: some View {
        List{
            if editMode?.wrappedValue == .active {
                TextField("New Item Name", text: $newItem).onSubmit {
                    checklist.addListItem(itemName: newItem,index: selfIndex)
                    newItem=""
                }
            }
            ForEach (self.checklist.mainList.file[selfIndex].checkListContainer.indices, id:\.self) {index in
                HStack{
                    Text(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemName)
                    Spacer()
                    Button(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemChecked ? "✓" : "")
                    {self.checklist.mainList.file[selfIndex].checkListContainer[index].toggleChecked()}
                }
            }.onDelete(perform: deleteItem)
        }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if self.editMode?.wrappedValue == .active {
                        HStack{
                            Image(systemName: "square.and.pencil").foregroundColor(.yellow)
                            TextField(checklist.mainList.file[selfIndex].checkListName, text: $title).onSubmit({
                                self.checklist.updateName(newName: title, index:selfIndex)
                                title=""
                            })
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.clear))
                        }
                    }
                    else {Text(checklist.mainList.file[selfIndex].checkListName)}
                }
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    if editMode?.wrappedValue == .active {
                        Button(checklist.resetStorage.count<1 ? "Reset" : "Undo") {
                            checklist.resetStorage.count<1 ? checklist.resetChecks(index: selfIndex) : checklist.undoReset(index: selfIndex)
                        }
                    }
                    EditButton()
                }
            }.onChange(of: editMode!.wrappedValue, perform: { value in
                if value.isEditing {
                    checklist.clearReset()
                }
                else {
                    self.checklist.updateName(newName: title, index:selfIndex)
                }
            })
    }
    
    func deleteItem(at offsets: IndexSet) {
        self.checklist.mainList.file[selfIndex].deleteListItem(atOffsets: offsets)
    }
    
}

