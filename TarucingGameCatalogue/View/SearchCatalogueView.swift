//
//  SearchCatalogueView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 22/01/23.
//

import SwiftUI

struct SearchCatalogueView: View {
    
    @ObservedObject var searchCatalogueViewModel = SearchCatalogueViewModel()
    
    @State private var searchTextMessage = ""

    var body: some View {
        ZStack {
            Image("tarucing_hut_ri_77")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                HStack {
                    Image(systemName: "magnifyingglass")
                    FirstTextFieldResponse(searchTextMessage: $searchTextMessage, placeholderMessage: SearchCataloguePage.searchcplaceholder)
                        .onChange(of: searchTextMessage) {
                            value in searchCatalogueViewModel.searchCatalogueAction(input: value)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.backgroundMenu))
                        .foregroundColor(.lightDarkColor)
                }
                .padding(.horizontal, 20)
                .padding(.top, 75)
                
                if searchCatalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.loaded {
                    VStack(alignment: .leading) {
                        ForEach(searchCatalogueViewModel.searchCatalogue) {
                            catalogue in SearchCatalogueItem(dataSearch: catalogue)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                
                else if searchCatalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.failed {
                    Text(ErrorLabel.terjadiError)
                        .foregroundColor(.lightDarkColor)
                        .padding()
                }
                
                else if searchCatalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.empty {
                    Text(SearchCataloguePage.searchNotFound)
                        .foregroundColor(.lightDarkColor).padding()
                }
                
                else if searchCatalogueViewModel.gamesRepositoryDataStatus == RepositoryDataStatus.loading {
                    LoadingCatalogue()
                        .padding()
                }
                
                MyCopyright()
            }
        }
    }
}

struct SearchCatalogueItem: View {
    let dataSearch: GamesModel

    var body : some View {
        NavigationLink(
            destination: DetailCatalogueView(gameId: Int(dataSearch.id))
                .navigationBarTitle(Text(TitlePage.detailCataloguePage))) {
                    VStack(alignment: .leading) {
                        Text(dataSearch.name)
                            .font(.custom("EncodeSansCondensed-Medium", size: 26))
                            .bold()
                            .foregroundColor(.lightDarkColor)
                            .lineLimit(2)
                        Text(dataSearch.platforms)
                            .font(.custom("EncodeSansCondensed-Medium", size: 16))
                            .foregroundColor(.lightDarkColor)
                            .lineLimit(1)
                            .padding(.bottom)
                    }
                }
    }
}

struct SearchCatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCatalogueView()
    }
}
