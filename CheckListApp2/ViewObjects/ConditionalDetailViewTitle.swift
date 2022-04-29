//
//  ConditionalDetailViewTitle.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI
///This view will show a text view of the checklist name is editmode is off, and will give a textfield if it is true. This textfield will allow changes to the name of the checklist on commit or deactivation of editmode
///- Parameter checklist: the viewmodel being passed into the view
///- Parameter editmode: a binding to the upper level editMode
///- Parameter title: a binding to the higher level string that will make changes to the checklists title
///- Parameter selfIndex: the index of the checklist this view exists within
///
///
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
