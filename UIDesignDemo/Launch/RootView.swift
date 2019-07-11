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
        CertificatesView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
#endif
