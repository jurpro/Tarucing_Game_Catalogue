//
//  ConstantExtension.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import Foundation
import SwiftUI

struct ApplicationHomeString {
    static let tarucingTitle = "Tarucing"
    static let tarucingTagline = "Best Place to Find Your Favorite Game"
    static let tarucingCopyright = "Copyright ©2023. Arif Lukman Bdg"
}

struct Repository {
    static let apiKey = "02a52e9f04334c91b4a35219d750e79a"
    static let baseUrl = "https://api.rawg.io/api"
 }

enum RepositoryDataStatus {
    case initial, loading, loaded, failed, empty
}

struct DateConversion {
    static func format(date: String) -> String {
        let arr = date.components(separatedBy: "-")
        let month = [
          "01": "Januari",
          "02": "Februari",
          "03": "Maret",
          "04": "April",
          "05": "Mei",
          "06": "Juni",
          "07": "Juli",
          "08": "Agustus",
          "09": "September",
          "10": "Oktober",
          "11": "November",
          "12": "Desember"
        ]
        return "\(arr[2]) \(month[arr[1]]!) \(arr[0])"
    }
}

struct MyProfile {
    static let titleProfile = "Profile"
    static let welcomeMessage = "Selamat datang, "
    static let pointProfile = "Your point 29188190"
    static let nameProfile = "Arif Lukman Bdg"
    static let emailProfile = "ujanglukmanbdg@gmail.com"
    static let cityProfile = "Kota Bandung - Jawa Barat"
    static let addressProfile = "Jl. Tatarucingan No. 78 RT. 05/03 Kel. Kaulinan Kec. Sodok Gobar"
    static let gamesFavProfile = "SimsCity Tycoon V.4.1"
    static let platformFavProfile = "XBox dan AppleTV"
    static let addressProfileLabel = "Alamat"
    static let cityProfileLabel = "Kota/Kab"
    static let gamesProfileLabel = "Games Favorit"
    static let platformProfileLabel = "Platform Favorit"
}

struct MenuIcon {
    static let menuCatalogue = "Catalogue"
    static let menuFavorite = "Favorite"
    static let menuSearch = "Search"
    static let menuTopGame = "Top 2022"
    static let menuProfile = "Profil Anda"
    static let menuLogout = "Logout"
}

struct ErrorLabel {
    static let terjadiError = "Something Error"
    static let cobaLagiError = "please try again later"
    static let reloadError = "Reload"
}

struct TitlePage {
    static let catalogueListPage = "Catalogue List"
    static let detailCataloguePage = "Detail Catalogue"
    static let aboutProfilePage = "Profile"
    static let searchPage = "Search"
    static let homePage = "Home"
    static let aboutTarucingPage = "About Tarucing"
    static let top2022Page = "Top 2022"
}

struct DetailCataloguePage {
    static let detailCatalogueAgeRating = "Age Rating"
    static let detailCataloguePlaytime = "Playtime"
    static let detailCatalogueRatingTop = "Rating Top"
    static let detailCataloguePlatform = "Platform"
    static let detailCatalogueGenre = "Genres"
    static let detailCatalogueRelease = "Release"
    static let detailCatalogueDescription = "About This Game"
    static let detailCatalogueSlug = "Slug"
    static let detailCatalogueWebsite = "Website"
    static let detailCatalogueReviewsCount = "Reviews Count"
    static let detailCatalogueReviewCountText = "Reviewers"
    static let detailCatalogueDeveloper = "Developer"
    static let detailCatalogueRedditChart = "Reddit Chart"
    static let detailCatalogueRedditName = "Reddit Name"
    static let detailCatalogueNil = "Not available"
    static let detailCatalogueRedditUnchart = "Unchart"
}

struct FavoriteCataloguePage {
    static let favoriteTitlePage = "MyFavorite"
    static let favoriteEmptyWarningPage = "Favorite Game Anda Kosong"
    static let favoriteText1Page = "Game favoritmu akan berada di halaman ini,"
    static let favoriteText2Page = "klik icon hati di setiap detail game yang kamu suka."
}

struct SearchCataloguePage {
    static let searchTitlePage = "Search"
    static let searchcplaceholder = "Search..."
    static let searchNotFound = "Game tidak ditemukan dalam katalog"
}

struct RatingLabel {
    static let outOfFive = "out of 5"
}

struct LabelExtension {
    static let loadingText = "Loading..."
}

struct SplashScreenText {
    static let splashWelcome = "TARUCING"
    static let splashDescription = "Tthe best place to search your favorite game"
}

extension Color {
    static let mainColor = Color("MainColor")
    static let backgroundMenu = Color("BackgroundMenu")
    static let blueColor = Color("BlueColor")
    static let redColor = Color("RedColor")
    static let greenColor = Color("GreenColor")
    static let lightDarkColor = Color("LightDarkColor")
    static let catalogueColor = Color("CatalogueColor")
}
