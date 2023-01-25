//
//  MapView.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -6.9174696,
                longitude: 107.6724023),
            
            span: MKCoordinateSpan(
                latitudeDelta: 0.04,
                longitudeDelta: 0.04)
        )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
