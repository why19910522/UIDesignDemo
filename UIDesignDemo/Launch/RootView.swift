//
//  RootView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/8.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Home().tabItem {
                VStack {
                    Image.iconHome
                    Text("Home")
                }
            }
            
            UpdateList().tabItem {
                VStack {
                    Image.iconSettings
                    Text("Update")
                }
            }
            
            Settings().tabItem {
                VStack {
                    Image.iconSettings
                    Text("Settings")
                }
            }
        }
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
