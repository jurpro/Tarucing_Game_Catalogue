//
//  MyCopyright.swift
//  TarucingGameCatalogue
//
//  Created by Arif Lukman on 18/01/23.
//

import SwiftUI

struct MyCopyright: View {
    var body: some View {
        Text(ApplicationHomeString.tarucingCopyright)
            .font(.custom("EncodeSansCondensed-Medium", size: 15))
            .multilineTextAlignment(.center)
            .padding(.all, 30.0)
    }
}

struct MyCopyright_Previews: PreviewProvider {
    static var previews: some View {
        MyCopyright()
    }
}
