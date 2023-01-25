//
//  CatalogueGameCard.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CatalogueGameCard: View {

    @ObservedObject var detailCatalogueViewModel = DetailCatalogueViewModel()
    
    let dataGames: GamesModel
    
    var body : some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 10,
                style: .continuous)
                .fill(Color.catalogueColor)
                .shadow(radius: 3)
            
            NavigationLink(
                destination: DetailCatalogueView(gameId: Int(dataGames.id))
                    .navigationBarTitle(Text(TitlePage.detailCataloguePage))) {
                    
                    HStack {
                        WebImage(url: URL(string: dataGames.image)!)
                            .placeholder {LoadingCatalogue()}
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100, alignment: Alignment.center)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7)
                            .padding()
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(dataGames.name)
                                .font(.custom("EncodeSansCondensed-Medium", size: 18)).bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.lightDarkColor)
                                .lineLimit(2)
                            
                            Label(
                                DateConversion.format(date: dataGames.released),
                                systemImage: "calendar.badge.clock")
                                .font(.custom("EncodeSansCondensed-Regular", size: 14))
                                .foregroundColor(.greenColor)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 5)
                            
                            HStack {
                                RatingGames(
                                    gamesRate: Int(dataGames.rating),
                                    ratingSize: 15)
                                
                                Spacer()
                            }
                            
                        }
                        .padding(10)
                    }
                    .cornerRadius(10)
                }
        }
        .padding(2.0)
    }
}
