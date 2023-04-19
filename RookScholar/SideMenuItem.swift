//
//  SideMenuItem.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 19.04.23.
//

import SwiftUI

struct SideMenuItem: View {
    
    var title : String
    var iconName : String
    
    var body: some View {
        
        HStack{
            
            Button {
                //print("Edit button was tapped")
            } label: {
                Label(title, systemImage: iconName)
            }
            .foregroundColor(Color("MainColor"))
            .font(.title2)
            //.foregroundColor(.white)
            

        }
        //.background(.mint)
        
    }
}

struct SideMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItem(title: "test", iconName: "bolt.fill")
    }
}
