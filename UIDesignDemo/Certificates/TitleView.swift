//
//  TitleView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct TitleView : View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image.illustration5
            Spacer()
            }.padding()
    }
}

#if DEBUG
struct TitleView_Previews : PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
#endif
