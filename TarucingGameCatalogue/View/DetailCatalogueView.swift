//
//  DetailGameCatalogueView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailCatalogueView: View {
    let gameId: Int

    @ObservedObject var detailCatalogueViewModel = DetailCatalogueViewModel()

    var body: some View {
        ZStack {
            if detailCatalogueViewModel.catalogueRepositoryDataStatus == RepositoryDataStatus.loaded {
                ScrollView {
                    // HeaderDetailView()
                    
                    ZStack(alignment: .bottom) {
                        let width = UIScreen.main.bounds.size.width

                        Rectangle()
                            .fill(Color.white)
                            .frame(width: width, height: 250)
                        WebImage(url: URL(string: detailCatalogueViewModel.catalogueDetail!.image)!)
                            .resizable()
                            .placeholder {LoadingCatalogue()}
                            .scaledToFill()
                            .frame(width: width, height: 250.0)
                            .clipped()
                        HStack {
                            Spacer()
                            Button(
                                action: {
                                    detailCatalogueViewModel.favoriteToogle()
                                },
                                label: {
                                    Image(systemName: detailCatalogueViewModel.isFavorite ? "heart.fill" : "heart")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                            )
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.red)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.trailing, 25)
                            .padding(.top, -230)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(detailCatalogueViewModel.catalogueDetail!.name)
                            .font(.custom("EncodeSansCondensed-Medium", size: 22))
                            .bold()
                            .foregroundColor(.lightDarkColor)
                        
                        RatingGames(
                            gamesRate: Int(detailCatalogueViewModel.catalogueDetail!.rating),
                            ratingSize: 30)
                            .padding(.bottom, 5)
                        
                        Text("\(detailCatalogueViewModel.catalogueDetail!.rating) \(RatingLabel.outOfFive)")
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .padding(.bottom, 5)
                        
                        VStack(alignment: .leading) {
                            if #available(iOS 16.0, *) {
                                Label(DetailCataloguePage.detailCatalogueDescription, systemImage: "checkmark.message.fill")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 17))
                                    .bold()
                                    .foregroundColor(.lightDarkColor)
                                    .padding(.bottom, 5)
                            } else {
                                Label(DetailCataloguePage.detailCatalogueDescription, systemImage: "checkmark.message.fill")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 17))
                                    .foregroundColor(.lightDarkColor)
                            }
                
                            Text("\(detailCatalogueViewModel.catalogueDetail!.description)")
                                .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                .foregroundColor(.lightDarkColor)
                                .padding(10.0)
                        }

                        HStack {
                            VStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueAgeRating, systemImage: "person.fill.checkmark")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueAgeRating, systemImage: "person.fill.checkmark")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                }
                                
                                Text("\(detailCatalogueViewModel.catalogueDetail!.ageRating)")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                            }
                            .frame(width: 105, height: 85, alignment: .center)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCataloguePlaytime, systemImage: "arrowtriangle.right.circle.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                } else {
                                    Label(DetailCataloguePage.detailCataloguePlaytime, systemImage: "arrowtriangle.right.circle.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                }
                                
                                Text("\(detailCatalogueViewModel.catalogueDetail!.playtime) hours")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                            }
                            .frame(width: 105, height: 85, alignment: .center)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            
                            VStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueRatingTop, systemImage: "waveform.and.magnifyingglass")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueRatingTop, systemImage: "waveform.and.magnifyingglass")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 2)
                                }
                                
                                Text("\(detailCatalogueViewModel.catalogueDetail!.ratingTop)")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                            }
                            .frame(width: 105, height: 85, alignment: .center)
                            .cornerRadius(10)
                            .frame(maxWidth: .infinity)
                            
                        }.padding(.bottom, 5)
                        
                        Group {
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCataloguePlatform, systemImage: "macpro.gen2.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom)
                                } else {
                                    Label(DetailCataloguePage.detailCataloguePlatform, systemImage: "macpro.gen2.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom)
                                }
                                
                                Text("\(detailCatalogueViewModel.catalogueDetail!.platforms)")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                                    .padding(.bottom, 5)
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueDeveloper, systemImage: "laptopcomputer")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueDeveloper, systemImage: "laptopcomputer")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                
                                if let developerDetail = detailCatalogueViewModel.catalogueDetail!.developers, !developerDetail.isEmpty {
                                    Text(developerDetail)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Text(DetailCataloguePage.detailCatalogueNil)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueGenre, systemImage: "photo.fill.on.rectangle.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueGenre, systemImage: "photo.fill.on.rectangle.fill")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                Text("\(detailCatalogueViewModel.catalogueDetail!.genres)")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                                    .padding(.bottom, 5)
                                     
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueRelease, systemImage: "calendar.badge.clock")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueRelease, systemImage: "calendar.badge.clock")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                Text(DateConversion.format(date: detailCatalogueViewModel.catalogueDetail!.released))
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                                    .padding(.bottom, 5)
                                     
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueSlug, systemImage: "pencil.tip.crop.circle.badge.plus")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueSlug, systemImage: "pencil.tip.crop.circle.badge.plus")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                
                                if let slugDetail = detailCatalogueViewModel.catalogueDetail!.slug, !slugDetail.isEmpty {
                                    Text(slugDetail)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Text(DetailCataloguePage.detailCatalogueNil)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueReviewsCount, systemImage: "arrow.counterclockwise.circle")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueReviewsCount, systemImage: "arrow.counterclockwise.circle")
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                Text("\(detailCatalogueViewModel.catalogueDetail!.reviewsCount) \(DetailCataloguePage.detailCatalogueReviewCountText)")
                                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                    .foregroundColor(.lightDarkColor)
                                    .padding(.bottom, 5)
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueWebsite, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueWebsite, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                
                                if let websiteDetail = detailCatalogueViewModel.catalogueDetail!.website, !websiteDetail.isEmpty {
                                    Text(websiteDetail)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Text(DetailCataloguePage.detailCatalogueNil)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueRedditChart, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueRedditChart, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                
                                if let redditDetail = detailCatalogueViewModel.catalogueDetail!.redditUrl, !redditDetail.isEmpty {
                                    Text(redditDetail)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Text(DetailCataloguePage.detailCatalogueRedditUnchart)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                            }
                            
                            HStack {
                                if #available(iOS 16.0, *) {
                                    Label(DetailCataloguePage.detailCatalogueRedditName, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .bold()
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Label(DetailCataloguePage.detailCatalogueRedditName, systemImage: "globe")
                                        .imageScale(.large)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .frame(width: 125.0)
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                                
                                if let redditNameDetail = detailCatalogueViewModel.catalogueDetail!.redditName, !redditNameDetail.isEmpty {
                                    Text(redditNameDetail)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                } else {
                                    Text(DetailCataloguePage.detailCatalogueNil)
                                        .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                        .foregroundColor(.lightDarkColor)
                                        .padding(.bottom, 5)
                                }
                            }
                        }
                        
                        HStack {
                            Spacer()
                        }
                    }.padding(.horizontal)
                    
                    MyCopyright()
                }
            }
            
            else if detailCatalogueViewModel.catalogueRepositoryDataStatus == RepositoryDataStatus.failed {
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
                        detailCatalogueViewModel.loadGame(id: gameId)
                    }
                }
            }
            
            else {
                LoadingCatalogue()
            }
        }
        .onAppear {
            detailCatalogueViewModel.loadGame(id: gameId)
            
        }
    }
}

struct DetailCatalogueView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCatalogueView(gameId: 4291)
    }
}
