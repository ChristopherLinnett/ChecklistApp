//
//  NewChecklistButton.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import SwiftUI
///A button displaying a plus sign that when clicked will add a new empty checklist to the main array of checklists
///- Parameter viewModel: the viewmodel being passed to this button
struct newChecklistButton: View {
    var viewModel: ViewModel
    var body: some View {
        Button("+") {       // adds new checklist and places list within edit mode
            viewModel.OnAddNewList()
        }.font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
    }}
