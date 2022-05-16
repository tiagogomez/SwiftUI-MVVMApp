//
//  CoreDataController.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 3/05/22.
//

import CoreData

struct CoreDataController: StorageControllerProtocol {

    static let shared = CoreDataController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MoviesDataModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func save() {
        let context = container.viewContext
        do {
            try context.save()
        } catch {
            fatalError("Core Data Storage Error")
        }
    }
    
    func isMovieStored(movie: Movie) -> Bool {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %i", movie.id ?? 0)
        
        do {
            let count = try container.viewContext.count(for: fetchRequest)
            
            return count >= 1
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    func storeMovie(movie: Movie) {
        if isMovieStored(movie: movie) { return }
        
        let movieEntity = MovieEntity(context: container.viewContext)
        movieEntity.id = Int32(movie.id ?? 0)
        movieEntity.title = movie.title
        movieEntity.overview = movie.overview
        movieEntity.poster = movie.poster
        movieEntity.backdrop = movie.backdrop
        
        save()
    }
    
    func removeMovie(movie: Movie) {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %i", movie.id ?? 0)
        
        do {
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            for item in fetchedResults {
                container.viewContext.delete(item)
            }
            
            save()
        } catch let error as NSError {
            fatalError(error.description)
        }
    }
    
    func fetchMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
        var movies = [Movie]()
        
        do {
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            for item in fetchedResults {
                let movie = Movie(id: Int(item.id),
                                  title: item.title,
                                  overview: item.overview,
                                  poster: item.poster,
                                  backdrop: item.backdrop)
                
                movies.append(movie)
            }
        } catch let error as NSError {
            fatalError(error.description)
        }
        
        return movies
    }
}
