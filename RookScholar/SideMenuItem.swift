//
//  SideMenuItem.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 19.04.23.
//

import SwiftUI





struct SideMenuItem: View {
    
    var name : String
    var iconName : String
    
    
    var body: some View {
        
        HStack{
            Label(name, systemImage: iconName)
            .foregroundColor(Color("MainColor"))
            .font(.title2)
        }
        
    }
}

struct SideMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItem(name: "test", iconName: "bolt.fill")
        
    }
}
