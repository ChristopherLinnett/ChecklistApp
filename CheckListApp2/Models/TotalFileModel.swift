//
//  totalFileModel.swift
//  CheckListApp2
//
//  Created by Christopher Linnett on 22/4/2022.
//

import Foundation

struct totalFile: Codable {
    var file: [MasterListObject]
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
