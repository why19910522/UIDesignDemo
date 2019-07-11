//
//  CardView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CardView : View {
    
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
      VStack {
        Text("Card Back")
        }
        .frame(width: 340.0, height: 220)
        .background(color)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        CardView(color: .blue)
    }
}
#endif
