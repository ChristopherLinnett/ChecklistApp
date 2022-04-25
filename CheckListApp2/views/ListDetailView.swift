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
                HStack {
                TextField("New Item Name", text: $newItem).onSubmit {
                    checklist.addListItem(itemName: newItem,index: selfIndex)
                    newItem=""
                }
                    Image(systemName: "plus.circle").foregroundColor(.green)
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
                    TextField(checklist.mainList.file[selfIndex].checkListName, text: $title).onSubmit({
                        self.checklist.updateName(newName: title, index:selfIndex)
                        title=""
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title)
                        Image(systemName: "square.and.pencil").foregroundColor(.yellow)
                    }
                }
                else {Text(checklist.mainList.file[selfIndex].checkListName).font(.title)}
            }
            ToolbarItemGroup(placement:.navigationBarLeading){
                EditButton()
            }
        }
    }
    func deleteItem(at offsets: IndexSet) {
        self.checklist.mainList.file[selfIndex].deleteListItem(atOffsets: offsets)
    }
}

