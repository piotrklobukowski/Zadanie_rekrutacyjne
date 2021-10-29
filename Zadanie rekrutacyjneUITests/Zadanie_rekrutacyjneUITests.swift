//
//  Zadanie_rekrutacyjneUITests.swift
//  Zadanie rekrutacyjneUITests
//
//  Created by Piotr Kłobukowski on 29/10/2021.
//

import XCTest

class Zadanie_rekrutacyjneUITests: XCTestCase {

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.tables.cells.element.waitForExistence(timeout: 5.0))
    }
}
