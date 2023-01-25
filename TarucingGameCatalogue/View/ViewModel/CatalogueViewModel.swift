//
//  CatalogueViewModel.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation
import SwiftyJSON

class CatalogueViewModel: ObservableObject {
    
    @Published var gamesCatalogue = [GamesModel]()
    
    @Published var gamesRepositoryDataStatus: RepositoryDataStatus = RepositoryDataStatus.initial

    init() {
        loadGamesCatalogue()
    }

    func loadGamesCatalogue() {
        DispatchQueue.main.async {
            self.gamesRepositoryDataStatus = RepositoryDataStatus.loading
        }
        
        guard let url = URL(string: "\(Repository.baseUrl)/games?key=\(Repository.apiKey)") else {return}
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            
            guard let response = response as? HTTPURLResponse,
                    let data = data else { return }
            
            if response.statusCode == 200 {
                do {
                    let json = try JSON(data: data)
                    
                    let items = json["results"].array!

                    for item in items {
                        
                        let platformList = item["platforms"].arrayValue.map {$0["platform"]["name"].stringValue}
                        let genreList = item["genres"].arrayValue.map {$0["name"].stringValue}
                        let developerList = item["developers"].arrayValue.map {$0["name"].stringValue}

                        let catalogue = GamesModel(
                            id: item["id"].int32Value,
                            name: item["name"].stringValue,
                            image: item["background_image"].stringValue,
                            released: item["released"].stringValue,
                            rating: item["rating"].int32Value,
                            metacritic: item["metacritic"].int32Value,
                            playtime: item["playtime"].int32Value,
                            platforms: platformList.joined(separator: ", "),
                            genres: genreList.joined(separator: ", "),
                            ageRating: item["esrb_rating"].stringValue,
                            slug: item["slug"].stringValue,
                            ratingTop: item["rating_top"].int32Value,
                            reviewsCount: item["reviews_count"].int32Value,
                            website: item["website"].stringValue,
                            developers: developerList.joined(separator: ", "),
                            redditUrl: json["reddit_url"].stringValue,
                            redditName: json["reddit_name"].stringValue
                        
                        )
                        
                        DispatchQueue.main.async {
                            self.gamesCatalogue.append(catalogue)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.gamesRepositoryDataStatus = RepositoryDataStatus.loaded
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.gamesRepositoryDataStatus = RepositoryDataStatus.failed
                    }
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.gamesRepositoryDataStatus = RepositoryDataStatus.failed
                }
            }
        }
        task.resume()
    }
}
