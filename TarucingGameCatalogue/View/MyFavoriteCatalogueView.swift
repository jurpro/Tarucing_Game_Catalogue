//
//  MyFavoriteCatalogueView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 19/01/23.
//

import SwiftUI

struct MyFavoriteCatalogueView: View {
    
    @ObservedObject var myFavoriteViewModel = MyFavoriteViewModel()

    var body: some View {
        ZStack {
            Image("tarucing_hut_ri_77")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            if myFavoriteViewModel.favoriteDataStatus == RepositoryDataStatus.loaded {
                ScrollView {
                    Spacer()
                        .frame(height: 70)
                    
                    ForEach(myFavoriteViewModel.favoriteCatalogue) {
                        favorite in CatalogueGameCard(dataGames: favorite)
                            .padding(
                                .bottom,
                                favorite.id == myFavoriteViewModel.favoriteCatalogue.last?.id ? 100 : 0
                            )
                    }
                    .padding(.horizontal, 10)
                    
                    MyCopyright()
                }
            }
            
            else if myFavoriteViewModel.favoriteDataStatus == RepositoryDataStatus.failed {
                VStack {
                    
                    Text(ErrorLabel.terjadiError)
                        .bold()
                        .font(.custom("EncodeSansCondensed-Medium", size: 26))
                        .foregroundColor(.lightDarkColor)
                        .padding(.bottom, 2)
                    
                    Text(ErrorLabel.cobaLagiError)
                        .font(.custom("EncodeSansCondensed-Medium", size: 16))
                        .foregroundColor(.lightDarkColor)
                        .padding(.bottom, 30)
                    
                    Button(ErrorLabel.reloadError) {
                        myFavoriteViewModel.loadFavoriteCatalogue()
                    }
                    
                    MyCopyright()
                }
            }
            
            else if myFavoriteViewModel.favoriteDataStatus == RepositoryDataStatus.empty {
                VStack {
                    
                    Text(FavoriteCataloguePage.favoriteEmptyWarningPage)
                        .bold()
                        .font(.custom("EncodeSansCondensed-Medium", size: 26))
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    
                    Text(FavoriteCataloguePage.favoriteText1Page)
                        .font(.custom("EncodeSansCondensed-Medium", size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 30)
                    
                    Text(FavoriteCataloguePage.favoriteText2Page)
                        .font(.custom("EncodeSansCondensed-Medium", size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom], 30)
                    
                    MyCopyright()
                }
            }
            
            else {
                LoadingCatalogue()
            }
            
        }
        .onAppear {
            myFavoriteViewModel
                .loadFavoriteCatalogue()
        }
    }
}

struct MyFavoriteCatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        MyFavoriteCatalogueView()
    }
}
