//
//  SideMenuUIView.swift
//  RookScholar
//
//  Created by Danail Dimitrov on 10.04.23.
//

import SwiftUI


struct ContentView:View {
    
    @State private var showMenu : Bool = false
    
    var body: some View{
        
        NavigationView{
            
            ZStack {
                Button("Open Menu") {
                    showMenu.toggle()
                }
                .foregroundColor(.red)
                
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        
//                        SideMenuUIView(showMenu:showMenu)
//                            .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
//                            .animation(.easeInOut(duration: 0.30), value: showMenu)
//
                    }
                }
                
            }
            .background(.mint.opacity(0))
            
            
        }
    }
}

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
    @State var isMovedOut = false

    
    var sideMenuOptions: [MenuOption] = [
        MenuOption(id: 0,name: "Articles", iconName: "list.bullet.rectangle.portrait.fill"),
        MenuOption(id: 1,name: "Info", iconName: "info.square.fill")]
    
    var body: some View{
        
            VStack{
                
                    ForEach(sideMenuOptions) { MenuOption in
                        
                        if(MenuOption.name == "Articles") {
                            NavigationLink(destination: ArticleTableUiView(), tag: 1, selection: $selection) {
                                Button{
                                    self.selection = 1
                                    print(MenuOption.name)
                                    

                                }label: {
                                    SideMenuItem(title: MenuOption.name , iconName: MenuOption.iconName)
                                }
                                .foregroundColor(Color("MainColor"))
                                .font(.title2)
                            }
                        }else{

                            NavigationLink(destination: InformationUiView(), tag: 2, selection: $selection) {
                                Button {
                                    self.selection = 2
                                    print(MenuOption.name)
                                    

                                }label: {
                                    SideMenuItem(title: MenuOption.name , iconName: MenuOption.iconName)
                                }
                                .foregroundColor(Color("MainColor"))
                                .font(.title2)
                            }
                        }
                        Divider()
                    }
                    .offset(x: isMovedOut ? UIScreen.main.bounds.width : 0)
                    Spacer()
                    
                }
                .padding(40)
                .background(Color("SideMenuColor"))
                .edgesIgnoringSafeArea(.bottom)
    }
   
    
}




struct SideMenuUIView_Previews: PreviewProvider {
    @Binding var showMenu:Bool
    static var previews: some View {
        ContentView()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .previewLayout(.sizeThatFits)
        SideMenuUIView()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
