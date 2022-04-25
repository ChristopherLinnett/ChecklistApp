//
//  Checklist.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI

struct Checklist: View {
    @ObservedObject var viewModel: ViewModel
    var index: Int
    var body: some View {
        NavigationLink(destination: ListDetailView(checklist: self.viewModel, selfIndex: index)) {Text(self.viewModel.mainList.file[index].checkListName)}
    }
}

