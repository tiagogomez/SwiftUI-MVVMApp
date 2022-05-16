//
//  DetailViewModelTests.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/05/22.
//

import XCTest
@testable import MVVMSwiftUI

class DetailViewModelTests: XCTestCase {

    var storageController: MockStorageController?
    var detailViewModel: DetailViewModel?

    override func setUp() {
        storageController = MockStorageController()
        detailViewModel = DetailViewModel(storageController: storageController!)
    }

    override func tearDown() {
        storageController?.mockStoredMovies = []
    }
    
    func testSetMovie_withValidMovie_shouldUpdateIsFavorite() {
        //Setup
        storageController?.mockStoredMovies = [MockMovies.getMockMovie()]
        let expectedMovie = MockMovies.getMockMovie()
        let expectedValue = true
        
        //Test
        detailViewModel?.setMovie(movie: MockMovies.getMockMovie())
        let movie = detailViewModel?.movie
        let isFavorite = detailViewModel?.isFavorite
        
        //Verify
        XCTAssertEqual(movie, expectedMovie, "The function should update the movie attribute and should not be empty")
        XCTAssertEqual(isFavorite, expectedValue, "The function should update the isFavorite attribute and should be true")
      }
    
    func testPressedFavoriteButton_withStoredMovie_shouldRemoveMovie() {
        //Setup
        storageController?.mockStoredMovies = [MockMovies.getMockMovie()]
        detailViewModel?.setMovie(movie: MockMovies.getMockMovie())
        let expectedMovies = [Movie]()
        let expectedValue = false

        //Test
        detailViewModel?.pressedFavoriteButton()
        let storedMovies = storageController?.mockStoredMovies
        let isFavorite = detailViewModel?.isFavorite

        //Verify
        XCTAssertEqual(storedMovies, expectedMovies, "The function should update the movies storage and should be empty")
        XCTAssertEqual(isFavorite, expectedValue, "The function should update the isFavorite attribute and should be false")
      }
    
    func testPressedFavoriteButton_withoutStoredMovie_shouldStoreMovie() {
        //Setup
        storageController?.mockStoredMovies = []
        detailViewModel?.setMovie(movie: MockMovies.getMockMovie())
        let expectedMovies = [MockMovies.getMockMovie()]
        let expectedValue = true

        //Test
        detailViewModel?.pressedFavoriteButton()
        let storedMovies = storageController?.mockStoredMovies
        let isFavorite = detailViewModel?.isFavorite

        //Verify
        XCTAssertEqual(storedMovies, expectedMovies, "The function should update the movies storage and should not be empty")
        XCTAssertEqual(isFavorite, expectedValue, "The function should update the isFavorite attribute and should be true")
      }

}
