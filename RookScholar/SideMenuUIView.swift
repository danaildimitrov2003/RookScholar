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
        
    }
    
    @State var selection: Int? = nil

    
    var sideMenuOptions: [MenuOption] = [
        MenuOption(id: 0,name: "Articles"),
        MenuOption(id: 1,name: "Info")]
    
    var body: some View{
        
            VStack{
                    ForEach(sideMenuOptions) { MenuOption in
//                        var Destination: View
//                        if(MenuOption.name == "Articles"){
//                            Destination = ArticleTableUiView()
//                        }
                        
                        if(MenuOption.name == "Articles") {
                            NavigationLink(destination: ArticleTableUiView(), tag: 1, selection: $selection) {
                                Button(MenuOption.name) {
                                    self.selection = 1
                                    print(MenuOption.name)
                                    //selectUiView(name: MenuOption.name)

                                }
                                .foregroundColor(Color("MainColor"))
                                .font(.title2)
                            }
                        }else{
                            
                            NavigationLink(destination: InformationUiView(), tag: 1, selection: $selection) {
                                Button(MenuOption.name) {
                                    self.selection = 1
                                    print(MenuOption.name)
                                    //selectUiView(name: MenuOption.name)

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
                .onTapGesture {
                    //showMenu.toggle()
                    //showMenu = showMenu
            }
    }
   
    //var name : String
    
//    func selectUiView(name: String) ->  any View {
//
//        switch name {
//        case "Articles":
//            return ArticleTableUiView()
//
//        case "Info":
//            return InformationUiView()
//
//        default:
//            print("Have you done something new?")
//            return ArticleTableUiView()
//        }
//
//
//    }
    
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
