//
//  ContentView.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel:ViewModel = ViewModel()
    @State var newListTitle:String = ""
    @Environment(\.editMode) var editMode
    var body: some View {
        NavigationView {
            List{
                ForEach (self.viewModel.mainList.file.indices, id: \.self) {index in
                    NavigationLink(destination: ListDetailView(checklist: self.viewModel, selfIndex: index)) {Text(self.viewModel.mainList.file[index].checkListName)}
                }.onDelete(perform:viewModel.deleteChecklist)
                    .onMove(perform: viewModel.doMove)
            }
            .navigationTitle("Checklists")
            .toolbar {
                ToolbarItemGroup(placement:.navigationBarLeading){
                    EditButton()
                }
                ToolbarItemGroup(placement:.navigationBarTrailing) {
                    newChecklistButton(viewModel: viewModel)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel:ViewModel())
    }
}
