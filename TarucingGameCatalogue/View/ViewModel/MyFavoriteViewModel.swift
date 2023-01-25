//
//  MyFavoriteViewModel.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 19/01/23.
//

import Foundation

class MyFavoriteViewModel: ObservableObject {
    
    @Published var favoriteCatalogue = [GamesModel]()
    
    @Published var favoriteDataStatus: RepositoryDataStatus = RepositoryDataStatus.initial

    private lazy var catalogueProvider: GameConnectNetwork = {
        return GameConnectNetwork()
    }()

    func loadFavoriteCatalogue() {
        
        DispatchQueue.main.async {
            self.favoriteDataStatus = RepositoryDataStatus.loading
        }
        
        self.catalogueProvider.getAllCatalogueGames {
            result in DispatchQueue.main.async {
                
                if result.isEmpty {
                    self.favoriteDataStatus = RepositoryDataStatus.empty
                    
                } else {
                    self.favoriteCatalogue = result
                    self.favoriteDataStatus = RepositoryDataStatus.loaded
                    
                }
            }
        }
    }
}
