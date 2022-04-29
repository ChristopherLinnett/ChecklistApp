//
//  totalFileModel.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation
///
///This refers to the main object model, the property 'file' will contain the data that will be coded to JSON format for saving/loading
///- Parameter file : a list of checklists
///- Parameter isLoading: a boolean check to see whether loading is complete
///- Parameter fileURL: a URL that holds the location that data will be saved/loaded from
///
struct totalFile: Codable {
    var file: [MasterListObject] {
        didSet {
            if !self.isLoading {self.save()}}
    }
    
    var isLoading = true
    var fileURL: URL {
        let fileName = "checklists.json"
        let fm = FileManager.default
        guard let documentsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return URL(fileURLWithPath: "/")}
        let fileURL = documentsDir.appendingPathComponent(fileName)
        return fileURL
    }
    
    func load() -> [MasterListObject] {
        guard let data = try? Data(contentsOf: fileURL),
              let file = try? JSONDecoder().decode([MasterListObject].self, from: data) else {return []}
        //        print(String(data: data, encoding: .utf8)!)
        return file
    }
    
    func save(){
        do {
            let data = try JSONEncoder().encode(self.file)
            
            try data.write(to: fileURL, options: .atomic)
            //            guard let dataString = String(data: data, encoding: .utf8) else {return}
            //            print(dataString)
        } catch {
            print("Could not write file \(error)")
        }
    }
    
    mutating func addNewList(){
        self.file.insert(MasterListObject(checkListName: "Checklist", checkListContainer: []), at: 0)
    }
    mutating func deleteChecklist(atOffsets: IndexSet){
        self.file.remove(atOffsets: atOffsets)
    }
    
    mutating func rename(newName:String,index:Int) {
        if newName == "" {return}
        if newName == self.file[index].checkListName {return}
        self.file[index].checkListName = newName
    }
    mutating func addObject(newItemName:String, index: Int) {
        if newItemName == "" {return}
        self.file[index].checkListContainer.insert(CheckBoxListItem(itemName:newItemName), at:0)
    }
}
