//
//  MockMovies.swift
//  MVVMSwiftUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/05/22.
//

import Foundation
@testable import MVVMSwiftUI

struct MockMovies {
    
    static func getMockMovie() -> Movie {
        let movie = Movie(id: 0,
                          title: "titleTest",
                          overview: "overviewTest",
                          poster: "posterTest",
                          backdrop: "backdropTest")
        return movie
    }
    
    static func getMockMovies() -> [Movie] {
        let movie1 = Movie(id: 1,
                           title: "titleTest1",
                           overview: "overviewTest1",
                           poster: "posterTest1",
                           backdrop: "backdropTest1")
        let movie2 = Movie(id: 2,
                           title: "titleTest2",
                           overview: "overviewTest2",
                           poster: "posterTest2",
                           backdrop: "backdropTest2")
        return [movie1, movie2]
    }
}
