//
//  ListDetailView.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import SwiftUI

///A list detaiil view. This view shows the individual list items that exist within a list
///- Parameters checklist: the viewmodel that is passed from the above level
///- Parameters selfIndex: the index of this list within the array of checklists
///- Parameters newItem: a placeholder string is bound to an input and will assign the name to any newly created items
///- Parameters title: a placeholder string bound to an input (only visible in edit mode) that will reassign the name of this list
///
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
                newItemNamer(newItem: $newItem, checklist: checklist, selfIndex: selfIndex)
            }
            ForEach (self.checklist.mainList.file[selfIndex].checkListContainer.indices, id:\.self) {index in
                HStack{
                    Text(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemName)
                    Spacer()
                    Button(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemChecked ? "✓" : "")
                    {self.checklist.mainList.file[selfIndex].checkListContainer[index].toggleChecked()
                    }
                }
            }.onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
        }
        .toolbar {
            ToolbarItem(placement: .principal){
                ConditionalDetailViewTitle(checklist: checklist, editMode: _editMode, title: $title, selfIndex: selfIndex)
            }
            ToolbarItemGroup(placement:.navigationBarTrailing){
                if editMode?.wrappedValue == .active {
                    ResetButton(checklist: checklist, selfIndex: selfIndex)
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
    func moveItem(from source: IndexSet, to destination: Int){
        self.checklist.mainList.file[selfIndex].checkListContainer.move(fromOffsets: source, toOffset: destination)
        self.checklist.clearReset()
   }
}





