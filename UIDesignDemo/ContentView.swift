//
//  ContentView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct RootView : View {
  var body: some View {
    ZStack {
        TitleView()
            .blur(radius: 20)
        
        CardBottomView()
            .blur(radius: 20)
        
        CardView(color: .red)
            .offset(x: 0.0, y: -40)
            .scaleEffect(0.85)
            .rotationEffect(Angle(degrees: 15))
            .rotation3DEffect(Angle(degrees: 50),
                              axis: (x: 10.0, y: 10.0, z: 10.0))
            .blendMode(.hardLight)
        
        CardView(color: .blue)
            .offset(x: 0.0, y: -20)
            .scaleEffect(0.9)
            .rotationEffect(Angle(degrees: 10))
            .rotation3DEffect(Angle(degrees: 40),
                              axis: (x: 10.0, y: 10.0, z: 10.0))
            .blendMode(.hardLight)
        
        CertificateView()
            .scaleEffect(0.95)
            .rotationEffect(Angle(degrees: 5))
            .rotation3DEffect(Angle(degrees: 30),
                              axis: (x: 10.0, y: 10.0, z: 10.0))
        
      }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
