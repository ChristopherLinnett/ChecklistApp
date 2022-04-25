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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        var myTestFile = totalFile(file:[])
        myTestFile.addNewList()
        XCTAssertEqual(myTestFile.file[0].checkListName,"Checklist") //checks structure can handle new list being added
        myTestFile.addObject(newItemName: "testItem", index: 0)
        XCTAssertEqual(myTestFile.file[0].checkListContainer[0].itemName,"testItem") //check individual checkbox items can be added
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
