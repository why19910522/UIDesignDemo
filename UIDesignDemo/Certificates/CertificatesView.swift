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
    @State var viewState = CGSize.zero
    
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
                .offset(x: viewState.width, y: viewState.height - (show ? 400 : 40))
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0),
                                  axis: rotation3DAxis)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.6))
            
            CardView()
                .background(Color.blue)
                .offset(x: viewState.width, y: viewState.height - (show ? 200 : 20))
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0),
                                  axis: rotation3DAxis)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.4))
            
            CertificateView()
                .offset(viewState)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0),
                                  axis: rotation3DAxis)
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { (value) in
                            self.viewState = value.translation
                            self.show = true
                        }
                        .onEnded{ (value) in
                            self.viewState = .zero
                            self.show = false
                        }
                )
            
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
