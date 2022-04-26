//
//  ConditionalDetailViewTitle.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI

struct ConditionalDetailViewTitle: View {
    @ObservedObject var checklist: ViewModel
    @Environment(\.editMode) var editMode
    @Binding var title:String
    var selfIndex: Int
    var body: some View {
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
}
