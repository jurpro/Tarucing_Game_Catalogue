//
//  CatalogueListContentView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI

struct CatalogueListContentView: View {
    
    @ObservedObject var catalogueViewModel = CatalogueViewModel()

    var body: some View {
        ZStack {
            Image("tarucing_hut_ri_77")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            if catalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.loaded {
                ScrollView {
                    
                    Spacer()
                        .frame(height: 90)
                    
                    ForEach(catalogueViewModel.gamesCatalogue) { catalogue in
                        CatalogueGameCard(dataGames: catalogue)
                            .padding(
                                .bottom,
                                catalogue.id == catalogueViewModel.gamesCatalogue.last?.id ? 100 : 0)
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            else if catalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.failed {
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
                        catalogueViewModel.loadGamesCatalogue()
                    }
                }
            }
            
            else {
                LoadingCatalogue()
            }
        }
        .navigationBarTitle(LocalizedStringKey(TitlePage.catalogueListPage))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CatalogueListContentView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueListContentView()
    }
}
