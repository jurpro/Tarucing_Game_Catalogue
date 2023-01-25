//
//  DetailGameViewModel.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation
import SwiftyJSON

class DetailCatalogueViewModel: ObservableObject {
    
    @Published var catalogueDetail: GamesModel?
    @Published var catalogueRepositoryDataStatus: RepositoryDataStatus = RepositoryDataStatus.initial
    @Published var isFavorite: Bool = false

    private lazy var catalogueProvider: GameConnectNetwork = {
        
        return GameConnectNetwork()
        
    }()

    func favoriteToogle() {
        if isFavorite {
            catalogueProvider.deleteCatalogue(Int(catalogueDetail!.id)) {
                DispatchQueue.main.async {
                    self.isFavorite = false
                }
            }
        } else {
            catalogueProvider.createCatalogue(catalogueDetail!) {
                DispatchQueue.main.async {
                    self.isFavorite = true
                }
            }
        }
    }

    func loadGame(id: Int) {
        catalogueProvider.getCatalogue(id) { data in
            if let data = data {
                DispatchQueue.main.async {
                    self.catalogueDetail = data
                    self.isFavorite = true
                    self.catalogueRepositoryDataStatus = RepositoryDataStatus.loaded
                }
            } else {
                self.loadGameFromNetwork(id: id)
            }
        }

    }

    func loadGameFromNetwork(id: Int) {
        DispatchQueue.main.async {
            self.catalogueRepositoryDataStatus = RepositoryDataStatus.loading
            self.isFavorite = false
        }

        guard let url = URL(string: "\(Repository.baseUrl)/games/\(id)?key=\(Repository.apiKey)")
        else {return}
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, _ in
            
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            
            if response.statusCode == 200 {
                do {
                    let json = try JSON(data: data)
                    
                    let platformList = json["platforms"].arrayValue.map {$0["platform"]["name"].stringValue}
                    let genreList = json["genres"].arrayValue.map {$0["name"].stringValue}
                    let developerList = json["developers"].arrayValue.map {$0["name"].stringValue}

                    let catalogue = GamesModel(
                        id: json["id"].int32Value,
                        name: json["name"].stringValue,
                        description: json["description_raw"].stringValue,
                        image: json["background_image"].stringValue,
                        released: json["released"].stringValue,
                        rating: json["rating"].int32Value,
                        metacritic: json["metacritic"].int32Value,
                        playtime: json["playtime"].int32Value,
                        platforms: platformList.joined(separator: ", "),
                        genres: genreList.joined(separator: ", "),
                        ageRating: json["esrb_rating"]["name"].stringValue,
                        slug: json["slug"].stringValue,
                        ratingTop: json["rating_top"].int32Value,
                        reviewsCount: json["reviews_count"].int32Value,
                        website: json["website"].stringValue,
                        developers: developerList.joined(separator: ", "),
                        redditUrl: json["reddit_url"].stringValue,
                        redditName: json["reddit_name"].stringValue
                    )
                    
                    DispatchQueue.main.async {
                        self.catalogueDetail = catalogue
                        self.catalogueRepositoryDataStatus = RepositoryDataStatus.loaded
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.catalogueRepositoryDataStatus = RepositoryDataStatus.failed
                    }
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
                DispatchQueue.main.async {
                    self.catalogueRepositoryDataStatus = RepositoryDataStatus.failed
                }
            }
        }
        task.resume()
    }
}
