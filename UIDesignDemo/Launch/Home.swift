//
//  Home.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/1.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

var menuItems = [MenuItem(title: "My Account", image: "person.crop.circle"),
                 MenuItem(title: "Billing", image: "creditcard"),
                 MenuItem(title: "Team", image: "person.2"),
                 MenuItem(title: "Sign out", image: "arrow.uturn.down")]
    
struct Home : View {
    
    @State var show = false
    @State var showCertificates = false
    
    var body: some View {
        ZStack {
            HomeList()
                .background(Color.clear)
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showCertificates ? 0.95 : 1)
                .animation(.default)
            
            CertificatesView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showCertificates ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -36, y: showCertificates ? 0 : 80)
                .animation(.spring())
            
            ZStack(alignment: .topTrailing) {
                HStack(spacing: 12) {
                    Button(action: {
                        self.showCertificates.toggle()
                    }) {
                        CircleButton(image: "person.crop.circle")
                    }
                    Button(action: {
                        
                    }) {
                        CircleButton(image: "bell")
                    }
                }
                Spacer()
            }
            .offset(x: -16, y: showCertificates ? 0 : 80)
            .animation(.spring())
            
            MenuView(show: $show)
        }
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif

struct MenuRow : View {
    var data: MenuItem
    var body: some View {
        HStack {
            Image(systemName: data.image)
                .imageScale(.large)
                .foregroundColor(Color.icons)
                .frame(width: 32, height: 32)
            Text(data.title)
                .font(.headline)
            Spacer()
        }
    }
}

struct MenuItem : Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

struct MenuView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menuItems) { item in
                MenuRow(data: item)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .animation(.default)
        .onTapGesture {
            self.show = false
        }
    }
}

struct MenuButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: {
                self.show = true
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: .buttonShadow, radius: 10, y: 10)
            }
            Spacer()
        }
    }
}

struct CircleButton: View {
    
    var image: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
        }
        .frame(width: 44, height: 44)
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .buttonShadow, radius: 10, y: 10)
    }
    
}
