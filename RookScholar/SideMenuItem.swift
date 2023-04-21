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
    //var myUIKitVC = SideMenuNavigationViewController()
    
    func navigateToSecondViewController() {
            let secondVC = ArticleTableViewController()
            let hostingController = UIHostingController(rootView: ArticleTableUiView())
            secondVC.present(hostingController, animated: true, completion: nil)
        }
    
    var body: some View {
        
        HStack{
            
           
                Label(title, systemImage: iconName)        
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
