//
//  CertificatesView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CertificatesView : View {
    
    @State var show = false
    
    var rotation3DAxis: (x: CGFloat, y: CGFloat, z: CGFloat) {
        return (x: 10.0, y: 10.0, z: 10.0)
    }
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(Color.red)
                .offset(x: 0.0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0),
                                  axis: rotation3DAxis)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.8))
            
            CardView()
                .background(show ? Color.red : Color.blue)
                .offset(x: 0.0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0),
                                  axis: rotation3DAxis)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.8))
            
            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0),
                                  axis: rotation3DAxis)
                .onTapGesture {
                    self.show.toggle()
                }
                .animation(.spring())
            
        }
    }
}

#if DEBUG
struct CertificatesView_Previews : PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
#endif
