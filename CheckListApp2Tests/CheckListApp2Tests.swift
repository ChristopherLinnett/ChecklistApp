//
//  CheckListApp2Tests.swift
//  CheckListApp2Tests
//
//  Created by Christopher Linnett on 22/4/2022.
//

import XCTest
@testable import CheckListApp2

class CheckListApp2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOuterLists() throws {
        //tests methods and functions that act on the main file
        var testingOuterlist = totalFile(file: [])  //instance main file
        testingOuterlist.addNewList()   //should create a new list within the file with name checklist
        XCTAssertEqual(testingOuterlist.file[0].checkListName,"Checklist")  //checking its name is correct
        
        testingOuterlist.rename(newName:"newName", index: 0)                //modifying checklist's name
        XCTAssertEqual(testingOuterlist.file[0].checkListName,"newName")    //checking name changed correctly
        
        testingOuterlist.addObject(newItemName:"object1",index:0)           //creating new checkbox item within list
        XCTAssertEqual(testingOuterlist.file[0].checkListContainer[0].itemName,"object1")   //testing new item has name
        
        testingOuterlist.deleteChecklist(atOffsets: IndexSet(0...0))        //deleting this checklist
        XCTAssertEqual(testingOuterlist.file.count,0)                        //checking the list is now empty
    }
    
    func testOnChecklistObject() throws {
        var testingList = MasterListObject(checkListName: "testList1", checkListContainer: [CheckBoxListItem(itemName: "item1", itemChecked: true)]) //instances a checklist with 1 itemm inside
        XCTAssertEqual(testingList.checkListContainer[0].itemName, "item1") //testing the instancing worked
        
        testingList.deleteListItem(atOffsets: IndexSet(0...0))              //running delete method to delete instanced checkbox item in list
        XCTAssertEqual(testingList.checkListContainer.count, 0)             //checking the list is now empty
        
    }

    func testOnItemsInChecklist() throws {
        var testingItem = CheckBoxListItem(itemName: "item1", itemChecked: false)   //instancing item
        XCTAssertEqual(testingItem.itemName, "item1")                           //checking the instancing worked correctly
        
        testingItem.toggleChecked()                                     //should toggle itemChecked property, in this case, to true
        XCTAssertEqual(testingItem.itemChecked, true)                   //testing previous statement
        
        testingItem.setFalse()                                          //should change itemChecked to false
        XCTAssertEqual(testingItem.itemChecked, false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
