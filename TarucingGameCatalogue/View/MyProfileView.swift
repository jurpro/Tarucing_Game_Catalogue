//
//  MyProfileView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 19/01/23.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        ZStack {
            Image("tarucing_hut_ri_77")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            VStack {
                MapView()
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300.0)
                
                Image("IMG_4126 copy")
                    .resizable()
                    .frame(width: 250, height: 250, alignment: Alignment.center)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }.shadow(radius: 7)
                    .offset(y: -150)
                    .padding(.bottom, -150)
                
                Text(MyProfile.nameProfile)
                    .font(.custom("EncodeSansCondensed-Medium", size: 30).bold())
                
                Label(MyProfile.emailProfile, systemImage: "mail.and.text.magnifyingglass")
                    .font(.custom("EncodeSansCondensed-Medium", size: 15))
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Label(MyProfile.addressProfileLabel, systemImage: "figure.walk.circle.fill")
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                            .padding(.leading, 8)
                        
                        Text(MyProfile.addressProfile)
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 60.0)
                    }
                    
                    HStack {
                        Label(MyProfile.cityProfileLabel, systemImage: "signpost.right.circle.fill")
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                        
                        Text(MyProfile.cityProfile)
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 50)
                    }
                    
                    HStack {
                        Label(MyProfile.gamesProfileLabel, systemImage: "flag.checkered.circle.fill")
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                        
                        Text(MyProfile.gamesFavProfile)
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                    }
                    
                    HStack {
                        Label(MyProfile.platformProfileLabel, systemImage: "headphones.circle.fill")
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                            .padding(.bottom, 2)
                        
                        Text(MyProfile.platformFavProfile)
                            .font(.custom("EncodeSansCondensed-Medium", size: 15))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }
                }
                
                Spacer()
                
                MyCopyright()
                
            }.padding(.bottom, 30)
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
