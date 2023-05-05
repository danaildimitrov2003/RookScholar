//
//  SideMenuUIView.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 10.04.23.
//

import SwiftUI




struct ArticleTableUiView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ArticleTableViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = UIViewControllerType()
               
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
      
}

struct InformationUiView: UIViewControllerRepresentable {
    typealias UIViewControllerType = InformationViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = UIViewControllerType()
               
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}




struct SideMenuUIView: View {
    
    struct MenuOption : Identifiable{
        var id: Int
        var name: String
        var iconName: String
        
    }
    
    @State var selection: Int? = nil
    
    
    var sideMenuOptions: [MenuOption] = [
        MenuOption(id: 0,name: "Articles", iconName: "list.bullet.rectangle.portrait.fill"),
        MenuOption(id: 1,name: "Info", iconName: "info.square.fill")]
    
    var navController = UINavigationViewController()
    var body: some View{
        
            VStack{
                
                    ForEach(sideMenuOptions) { MenuOption in
                        
                        if(MenuOption.name == "Articles") {
                            NavigationLink(destination: ArticleTableUiView(), tag: 1, selection: $selection) {
                                Button {
                                    self.selection = 1
                                    }label: {
                                        SideMenuItem(name: MenuOption.name , iconName: MenuOption.iconName)
                                    }
                                }
                        }else{
                            NavigationLink(destination: InformationUiView(), tag: 2, selection: $selection) {
                                Button {
                                    self.selection = 2
                                }label: {
                                    SideMenuItem(name: MenuOption.name , iconName: MenuOption.iconName)
                                }
                                .foregroundColor(Color("MainColor"))
                                .font(.title2)
                            }
                        }
                        Divider()
                    }
                    
                    Spacer()
                    
                }
                .padding(40)
                .background(Color("SideMenuColor"))
                .edgesIgnoringSafeArea(.bottom)
                .frame(width: 185)
    }
        
   
    
}




struct SideMenuUIView_Previews: PreviewProvider {
    @Binding var showMenu:Bool
    static var previews: some View {
        SideMenuUIView()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
