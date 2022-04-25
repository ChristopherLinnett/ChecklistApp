//
//  NewItemNamer.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI

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
