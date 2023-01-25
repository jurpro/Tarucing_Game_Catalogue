//
//  SearchCatalogueViewModel.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 22/01/23.
//

import Foundation
import SwiftUI
import SwiftyJSON

class SearchCatalogueViewModel: ObservableObject {
    
    @Published var searchCatalogue = [GamesModel]()
    
    @Published var gamesRepositoryDataStatus: RepositoryDataStatus = RepositoryDataStatus.initial

    var debounceTimer: Timer?

    func searchCatalogueAction(input: String) {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.searchCatalogue.removeAll()
            if !input.isEmpty {
                self.loadCatalogueSearch(input: input)
            }
        }
    }

    func loadCatalogueSearch(input: String) {
        DispatchQueue.main.async {
            self.gamesRepositoryDataStatus = RepositoryDataStatus.loading
        }
        guard let url =
                URL(string: "\(Repository.baseUrl)/games?search=\(input)&key=\(Repository.apiKey)")
        else {return}
        
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
                        let developerList = json["developers"].arrayValue.map {$0["name"].stringValue}

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
                            slug: json["slug"].stringValue,
                            ratingTop: json["rating_top"].int32Value,
                            reviewsCount: json["reviews_count"].int32Value,
                            website: json["website"].stringValue,
                            developers: developerList.joined(separator: ", "),
                            redditUrl: json["reddit_url"].stringValue,
                            redditName: json["reddit_name"].stringValue
                        )
                        
                        DispatchQueue.main.async {
                            self.searchCatalogue.append(catalogue)
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.gamesRepositoryDataStatus = self.searchCatalogue.isEmpty ? RepositoryDataStatus.empty : RepositoryDataStatus.loaded
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

struct FirstTextFieldResponse: UIViewRepresentable {
    
    @Binding var searchTextMessage: String
    let placeholderMessage: String

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var textResponse: String
        var becameFirstResponder = false

        init(text: Binding<String>) {
            self._textResponse = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            textResponse = textField.text ?? ""
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchTextMessage)
    }

    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        
        textField.delegate = context.coordinator
        textField.placeholder = placeholderMessage
        
        return textField
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
            
        }
    }
}
