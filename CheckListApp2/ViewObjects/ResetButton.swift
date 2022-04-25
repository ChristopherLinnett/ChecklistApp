//
//  ResetButton.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 25/4/2022.
//

import SwiftUI

struct ResetButton: View {
    @ObservedObject var checklist:ViewModel
    var selfIndex: Int
    var body: some View {
        Button(checklist.resetStorage.count<1 ? "Reset" : "Undo") {
            checklist.resetStorage.count<1 ? checklist.resetChecks(index: selfIndex) : checklist.undoReset(index: selfIndex)
        }
    }
}
