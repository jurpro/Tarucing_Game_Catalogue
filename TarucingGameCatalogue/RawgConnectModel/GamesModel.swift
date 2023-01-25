//
//  GamesModel.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation

struct GamesModel: Identifiable {
    var id: Int32
    var name: String = ""
    var description: String = ""
    var image: String
    var released: String = ""
    var rating: Int32
    var metacritic: Int32 = -1
    var playtime: Int32
    var platforms: String = ""
    var genres: String = ""
    var ageRating: String = "Not rated"
    var slug: String? = ""
    var ratingTop: Int32
    var reviewsCount: Int32
    var website: String? = ""
    var developers: String? = ""
    var redditUrl: String? = ""
    var redditName: String? = ""

}
