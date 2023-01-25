//
//  GameConnectProvider.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation
import CoreData

class GameConnectNetwork {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "FavoriteGame")

        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil

        return container
    }()

    private func newTaskContext() -> NSManagedObjectContext {
        
        let taskContext = persistentContainer.newBackgroundContext()
        
        taskContext.undoManager = nil
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        return taskContext
    }

    func getAllCatalogueGames(completion: @escaping(_ games: [GamesModel]) -> Void) {
        
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Catalogue")
            
            do {
                let results = try taskContext.fetch(fetchRequest)
                var catalogueList: [GamesModel] = []
                
                for result in results {
                    let catalogue = GamesModel(
                        id: result.value(forKeyPath: "game_id") as! Int32,
                        name: result.value(forKeyPath: "name") as! String,
                        description: result.value(forKeyPath: "game_description") as! String,
                        image: result.value(forKeyPath: "image") as! String,
                        released: result.value(forKeyPath: "released") as! String,
                        rating: result.value(forKeyPath: "rating") as! Int32,
                        metacritic: result.value(forKeyPath: "metacritic") as! Int32,
                        playtime: result.value(forKeyPath: "playtime") as! Int32,
                        platforms: result.value(forKeyPath: "platforms") as! String,
                        genres: result.value(forKeyPath: "genres") as! String,
                        ageRating: result.value(forKeyPath: "age_rating") as! String,
                        slug: result.value(forKeyPath: "slug") as? String,
                        ratingTop: result.value(forKeyPath: "rating_top") as! Int32,
                        reviewsCount: result.value(forKeyPath: "reviews_count") as! Int32,
                        website: result.value(forKeyPath: "website") as? String,
                        developers: result.value(forKeyPath: "developers") as? String,
                        redditUrl: result.value(forKeyPath: "reddit_url") as? String,
                        redditName: result.value(forKeyPath: "reddit_name") as? String
                    )

                    catalogueList.append(catalogue)
                }
                completion(catalogueList)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }

    func getCatalogue(_ id: Int, completion: @escaping(_ game: GamesModel?) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Catalogue")
            
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "game_id == \(id)")

            do {
                if let result = try taskContext.fetch(fetchRequest).first {
                    let catalogue = GamesModel(
                        id: result.value(forKeyPath: "game_id") as! Int32,
                        name: result.value(forKeyPath: "name") as! String,
                        description: result.value(forKeyPath: "game_description") as! String,
                        image: result.value(forKeyPath: "image") as! String,
                        released: result.value(forKeyPath: "released") as! String,
                        rating: result.value(forKeyPath: "rating") as! Int32,
                        metacritic: result.value(forKeyPath: "metacritic") as! Int32,
                        playtime: result.value(forKeyPath: "playtime") as! Int32,
                        platforms: result.value(forKeyPath: "platforms") as! String,
                        genres: result.value(forKeyPath: "genres") as! String,
                        ageRating: result.value(forKeyPath: "age_rating") as! String,
                        slug: result.value(forKeyPath: "slug") as? String,
                        ratingTop: result.value(forKeyPath: "rating_top") as! Int32,
                        reviewsCount: result.value(forKeyPath: "reviews_count") as! Int32,
                        website: result.value(forKeyPath: "website") as? String,
                        developers: result.value(forKeyPath: "developers") as? String,
                        redditUrl: result.value(forKeyPath: "reddit_url") as? String,
                        redditName: result.value(forKeyPath: "reddit_name") as? String
                    )

                    completion(catalogue)
                } else {
                    completion(nil)
                }
            } catch let error as NSError {
                print("Could not load. \(error), \(error.userInfo)")
            }
        }
    }

    func createCatalogue(_ input: GamesModel, completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "Catalogue", in: taskContext) {
                
                let catalogue = NSManagedObject(entity: entity, insertInto: taskContext)
                
                self.getMaxId { id in
                    catalogue.setValue(id+1, forKeyPath: "id")
                    catalogue.setValue(input.id, forKeyPath: "game_id")
                    catalogue.setValue(input.name, forKeyPath: "name")
                    catalogue.setValue(input.description, forKeyPath: "game_description")
                    catalogue.setValue(input.image, forKeyPath: "image")
                    catalogue.setValue(input.released, forKeyPath: "released")
                    catalogue.setValue(input.rating, forKeyPath: "rating")
                    catalogue.setValue(input.metacritic, forKeyPath: "metacritic")
                    catalogue.setValue(input.playtime, forKeyPath: "playtime")
                    catalogue.setValue(input.platforms, forKeyPath: "platforms")
                    catalogue.setValue(input.genres, forKeyPath: "genres")
                    catalogue.setValue(input.ageRating, forKeyPath: "age_rating")
                    catalogue.setValue(input.slug, forKeyPath: "slug")
                    catalogue.setValue(input.ratingTop, forKeyPath: "rating_top")
                    catalogue.setValue(input.reviewsCount, forKeyPath: "reviews_count")
                    catalogue.setValue(input.website, forKeyPath: "website")
                    catalogue.setValue(input.developers, forKeyPath: "developers")
                    catalogue.setValue(input.redditUrl, forKeyPath: "reddit_url")
                    catalogue.setValue(input.redditName, forKeyPath: "reddit_name")

                    do {
                        try taskContext.save()
                        completion()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                }
            }
        }
    }

    func deleteCatalogue(_ id: Int, completion: @escaping() -> Void) {
        let taskContext = newTaskContext()
        
        taskContext.perform {
            let loadRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Catalogue")
            
            loadRequest.fetchLimit = 1
            loadRequest.predicate = NSPredicate(format: "game_id == \(id)")
            
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: loadRequest)
            
            batchDeleteRequest.resultType = .resultTypeCount
            
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult {
                if batchDeleteResult.result != nil {
                    completion()
                }
            }
        }
    }

    func getMaxId(completion: @escaping(_ maxId: Int) -> Void) {
        
        let taskContext = newTaskContext()
        
        taskContext.performAndWait {
            let loadRequest = NSFetchRequest<NSManagedObject>(entityName: "Catalogue")
            let sortDescriptor = NSSortDescriptor(key: "id", ascending: false)
            
            loadRequest.sortDescriptors = [sortDescriptor]
            loadRequest.fetchLimit = 1
            
            do {
                let lastCatalogue = try taskContext.fetch(loadRequest)
                if let catalogue = lastCatalogue.first,
                    let position = catalogue.value(forKeyPath: "id") as? Int {
                    completion(position)
                } else {
                    completion(0)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
