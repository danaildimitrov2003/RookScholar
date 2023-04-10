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
                Color.mint.ignoresSafeArea(.all, edges: .all)
                Button("Open Menu") {
                    showMenu.toggle()
                }
                .foregroundColor(.red)
                
                GeometryReader { _ in
                    HStack {
                        Spacer()
                        
                        SideMenuUIView(showMenu:$showMenu)
                            .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.30), value: showMenu)
                        
                    }
                }
            }
            
            
        }
    }
}

struct SideMenuUIView: View {
    
    struct MenuOption : Identifiable{
        var id: Int
        var name: String
        
    }
    
    @Binding var showMenu:Bool
    var sideMenuOptions: [MenuOption] = [
        MenuOption(id: 0,name: "Articles"),
        MenuOption(id: 1,name: "Info")]
    
    var body: some View{
        VStack{
            ForEach(sideMenuOptions) { MenuOption in
                Button(MenuOption.name) {
                    //navigate somehow
                    print(MenuOption.name)
                }
                .foregroundColor(.black)
                .font(.title)
            }
            Spacer()
            
        }
        .padding(32)
        .background(Color.purple)
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            showMenu.toggle()
        }
        
    }
}


struct SideMenuUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //SideMenuUIView()
        
    }
}
