//
//  SideMenuHeader.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 19.04.23.
//

import SwiftUI

struct SideMenuHeader: View {
    var body: some View {
        
        HStack {
            Spacer()
            Button {
               
            } label: {
                Image(systemName: "xmark")        }
            .foregroundColor(Color("MainColor"))
        .font(.title2)
        }
    }
}

struct SideMenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeader()
    }
}
