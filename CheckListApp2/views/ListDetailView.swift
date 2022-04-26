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
                newItemNamer(newItem: $newItem, checklist: checklist, selfIndex: selfIndex)
            }
            ForEach (self.checklist.mainList.file[selfIndex].checkListContainer.indices, id:\.self) {index in
                HStack{
                    Text(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemName)
                    Spacer()
                    Button(self.checklist.mainList.file[selfIndex].checkListContainer[index].itemChecked ? "✓" : "")
                    {self.checklist.mainList.file[selfIndex].checkListContainer[index].toggleChecked()
                        checklist.mainList.save()
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
        self.checklist.mainList.save()
    }
    func moveItem(from source: IndexSet, to destination: Int){
        self.checklist.mainList.file[selfIndex].checkListContainer.move(fromOffsets: source, toOffset: destination)
        self.checklist.clearReset()
        self.checklist.mainList.save()
    }
}





