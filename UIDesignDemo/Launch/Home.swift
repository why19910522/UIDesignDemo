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
  @State var showUpdate = false
  
  var body: some View {
    ZStack {
      HomeList()
        .background(Color.clear)
        .blur(radius: show ? 20 : 0)
        .scaleEffect(showCertificates ? 0.95 : 1)
        .animation(.default)
      
      CertificatesView()
        .frame(minWidth: 0, maxWidth: 712,
               minHeight: 0, maxHeight: screen.height)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .animation(.spring())
        .offset(y: showCertificates ? statusBarH+40 : screen.height)
      
      MenuButton(show: $show)
        .offset(x: -36, y: showCertificates ? statusBarH : 80)
        .animation(.spring())
      
      ZStack(alignment: .topTrailing) {
        HStack(spacing: 12) {
          Button(action: {
            self.showCertificates.toggle()
          }) {
            CircleButton(image: "person.crop.circle")
          }
          Button(action: {
            self.showUpdate.toggle()
          }) {
            CircleButton(image: "bell")
              .sheet(isPresented: self.$showUpdate) {
                UpdateList()
            }
          }
        }
        Spacer()
      }
      .offset(x: -16, y: showCertificates ? statusBarH : 80)
      .animation(.spring())
      
      MenuView(show: $show)
        .padding(.top, statusBarH)
    }
    .background(Color.background)
    .edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
  static var previews: some View {
    Group {
      Home().previewDevice("iPhone SE")
      Home().previewDevice("iPhone Xʀ")
      Home().previewDevice("iPad Pro (9.7-inch)")
    }
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
    HStack {
      VStack(alignment: .leading, spacing: 20) {
        ForEach(menuItems) { item in
          MenuRow(data: item)
        }
        
        Spacer()
        
        HStack {
          Text("Version 0.92")
            .foregroundColor(.gray)
          
          Spacer()
        }
      }
      .padding(.leading, 20)
      .padding(.top, 20)
      .padding(30)
      .frame(minWidth: 0, maxWidth: 360)
      .background(Color.white)
      .cornerRadius(30)
      .padding(.trailing, 60)
      .shadow(radius: 20)
      .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10, z: 0))
      .offset(x: show ? -30 : -screen.width)
      .animation(.default)
      .onTapGesture {
        self.show = false
      }
      
      Spacer()
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

