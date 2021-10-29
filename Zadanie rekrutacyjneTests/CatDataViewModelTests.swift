//
//  CatDataViewModelTests.swift
//  Zadanie rekrutacyjneTests
//
//  Created by Piotr Kłobukowski on 28/10/2021.
//

import XCTest

class CatDataViewModelTests: XCTestCase {
    
    var sut: CatDataViewModel!

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCatsCellsCountOnMockedData() throws {
        sut = CatDataViewModel(catDataProvider: MockCatDataProvider())
        let expectation = XCTestExpectation(description: "Download cats")
        sut.didLoadHandler = {
            XCTAssertTrue(self.sut.cellViewModels.count == 5)
            expectation.fulfill()
        }
        sut.fetchListOfCatData()
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testCatsCellsCountOnRealData() throws {
        sut = CatDataViewModel(catDataProvider: CatAPIService())
        let expectation = XCTestExpectation(description: "Download cats")
        sut.didLoadHandler = {
            XCTAssertTrue(self.sut.cellViewModels.count == 5)
            expectation.fulfill()
        }
        sut.fetchListOfCatData()
        
        wait(for: [expectation], timeout: 5.0)
    }
}
