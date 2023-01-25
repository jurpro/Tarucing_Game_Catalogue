//
//  RatingGames.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI

struct RatingGames: View {
    
    let gamesRate: Int
    let ratingSize: CGFloat
    
    var body: some View {
        HStack {
            if gamesRate > 0 {
                ForEach((1...gamesRate), id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(
                            width: ratingSize,
                            height: ratingSize,
                            alignment: Alignment.center)
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct RatingGames_Previews: PreviewProvider {
    static var previews: some View {
        RatingGames(
            gamesRate: 5,
            ratingSize: 50)
    }
}
