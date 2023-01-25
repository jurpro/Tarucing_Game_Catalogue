//
//  ContentView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI

struct HomeContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("tarucing_hut_ri_77")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text(ApplicationHomeString.tarucingTitle)
                        .font(.custom("EncodeSansCondensed-ExtraBold", size: 38))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 100.0)
                    
                    Text(ApplicationHomeString.tarucingTagline)
                        .font(.custom("EncodeSansCondensed-Medium", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    HStack {
                        NavigationLink(
                            destination: MyProfileView()
                                .navigationBarTitle(Text(MyProfile.titleProfile))) {
                                    Image("IMG_4126 copy")
                                        .resizable()
                                        .frame(width: 120, height: 120, alignment: Alignment.center)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(.white, lineWidth: 4)
                                        }.shadow(radius: 7)
                                        .padding()
                                    
                                    VStack {
                                        Text(MyProfile.welcomeMessage)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 18))
                                            .multilineTextAlignment(.center)
                                        
                                        Text(MyProfile.nameProfile)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 18).bold())
                                            .multilineTextAlignment(.center)
                                        
                                        Label(MyProfile.pointProfile, systemImage: "bolt.fill")
                                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                                            .foregroundColor(.lightDarkColor)
                                            .padding(.vertical, 3.0)
                                    }
                                }
                    }
                    
                    HStack {
                        NavigationLink(
                            destination: CatalogueListContentView()
                                .navigationBarTitle(Text(TitlePage.catalogueListPage))) {
                                    VStack {
                                        Image(systemName: "gamecontroller.fill")
                                            .resizable()
                                            .frame(width: 65, height: 45)
                                            .foregroundColor(Color("LightDarkColor"))
                                        
                                        Text(MenuIcon.menuCatalogue)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.lightDarkColor)
                                            .padding(.bottom, 2)
                                    }
                                    .frame(width: 105, height: 105, alignment: .center)
                                    .background(Color.backgroundMenu.opacity(0.75))
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity)
                                }
                        
                        NavigationLink(
                            destination: MyFavoriteCatalogueView()
                                .navigationBarTitle(Text(FavoriteCataloguePage.favoriteTitlePage))) {
                                    VStack {
                                        Image(systemName: "bolt.heart.fill")
                                            .resizable()
                                            .frame(width: 50, height: 45)
                                            .foregroundColor(Color("LightDarkColor"))
                                        
                                        Text(MenuIcon.menuFavorite)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.lightDarkColor)
                                            .padding(.bottom, 2)
                                    }
                                    .frame(width: 105, height: 105, alignment: .center)
                                    .background(Color.backgroundMenu.opacity(0.75))
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity)
                                }
                        
                        NavigationLink(
                            destination: SearchCatalogueView()
                                .navigationBarTitle(Text(SearchCataloguePage.searchTitlePage))) {
                                    VStack {
                                        Image("searching-for-home-svgrepo-com")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(Color("LightDarkColor"))
                                        
                                        Text(MenuIcon.menuSearch)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.lightDarkColor)
                                            .padding(.bottom, 2)
                                    }
                                    .frame(width: 105, height: 105, alignment: .center)
                                    .background(Color.backgroundMenu.opacity(0.75))
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity)
                                }
                    }
                    .padding(10)
                    
                    HStack {
                        VStack {
                            Image("upload-arrow-svgrepo-com")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("LightDarkColor"))
                            
                            Text(MenuIcon.menuTopGame)
                                .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.lightDarkColor)
                                .padding(.bottom, 2)
                        }
                        .frame(width: 105, height: 105, alignment: .center)
                        .background(Color.backgroundMenu.opacity(0.75))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        
                        NavigationLink(
                            destination: MyProfileView()
                                .navigationBarTitle(Text(MyProfile.titleProfile))) {
                                    VStack {
                                        Image("man-with-tie-profile-svgrepo-com")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(Color("LightDarkColor"))
                                        
                                        Text(MenuIcon.menuProfile)
                                            .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.lightDarkColor)
                                            .padding(.bottom, 2)
                                    }
                                    .frame(width: 105, height: 105, alignment: .center)
                                    .background(Color.backgroundMenu.opacity(0.75))
                                    .cornerRadius(10)
                                    .frame(maxWidth: .infinity)
                                }
                        
                        VStack {
                            Image("gnome-session-logout-svgrepo-com")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color("LightDarkColor"))
                            
                            Text(MenuIcon.menuLogout)
                                .font(.custom("EncodeSansCondensed-Medium", size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.lightDarkColor)
                                .padding(.bottom, 2)
                        }
                        .frame(width: 105, height: 105, alignment: .center)
                        .background(Color.backgroundMenu.opacity(0.75))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(10)
                    
                    Spacer()
                    
                    MyCopyright()
                        .padding(.bottom, 35.0)
                    
                }
            }
        }
        .accentColor(.mainColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
