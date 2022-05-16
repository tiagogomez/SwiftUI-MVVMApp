//
//  FavoriteViewModelTests.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/05/22.
//

import XCTest
@testable import MVVMSwiftUI

class FavoriteViewModelTests: XCTestCase {
    
    var storageController: MockStorageController?
    var favoriteViewModel: FavoriteViewModel?

    override func setUp() {
        storageController = MockStorageController()
        favoriteViewModel = FavoriteViewModel(storageController: storageController!)
    }

    override func tearDown() {
        storageController?.mockStoredMovies = []
    }
    
    func testGetMovies_withStoredMovies_shouldReturnStoredMovies() {
        //Setup
        storageController?.mockStoredMovies = MockMovies.getMockMovies()
        let expectedMovies = MockMovies.getMockMovies()
        
        //Test
        favoriteViewModel?.getMovies()
        let movies = favoriteViewModel?.movies
        
        //Verify
        XCTAssertEqual(movies, expectedMovies, "The function should update the movies list attribute and should not be empty")
      }
    
    func testGetMovies_withoutStoredMovies_shouldNotReturnStoredMovies() {
        //Setup
        storageController?.mockStoredMovies = []
        let expectedMovies = [Movie]()
        
        //Test
        favoriteViewModel?.getMovies()
        let movies = favoriteViewModel?.movies
        
        //Verify
        XCTAssertEqual(movies, expectedMovies, "The function should return an empty array of movies")
      }
}
