//
//  NewItemNamer.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI
///This textfield conditionally appears when editmode is editing within the listdetailview, upon a commit with text entered, a new checkbox item will be generated in the list
///- Parameter newItem: a binding to the above level parameter that will be assigned to the title of newly generated checkbox items
///- Parameter checklist: the viewmodel beingg passed to this view
struct newItemNamer: View {
    @Binding var newItem:String
    @ObservedObject var checklist:ViewModel
    var selfIndex: Int
    var body: some View {
        HStack {
            Text("⊕").font(.largeTitle).foregroundColor(.green)
            TextField("New Item Name", text: $newItem).onSubmit {
                checklist.addListItem(itemName: newItem,index: selfIndex)
                newItem=""
            }
        }
    }
}
