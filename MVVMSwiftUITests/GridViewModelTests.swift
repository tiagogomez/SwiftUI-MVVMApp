//
//  GridViewModelTests.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/05/22.
//

import XCTest
@testable import MVVMSwiftUI


class GridViewModelTests: XCTestCase {

    var networkController: MockNetworkController?
    var sutGridViewModel: GridViewModel?

    override func setUp() {
        super.setUp()
        networkController = MockNetworkController()
        sutGridViewModel = GridViewModel(networkController: networkController!)
    }

    override func tearDown() {
        networkController = nil
        sutGridViewModel = nil
        super.tearDown()
    }

    func testGetMovies_withValidResponse_shouldReturnMovies() {
        //Setup
        networkController?.mockResponseMovies = MockMovies.getMockMovies()
        let expectedMovies = MockMovies.getMockMovies()
        
        //Test
        sutGridViewModel?.getMovies()
        networkController?.closureSuccess()
        let movies = sutGridViewModel?.movies
        
        //Verify
        XCTAssertEqual(movies, expectedMovies, "The function should update the movies list attribute and should not be empty")
      }

}
