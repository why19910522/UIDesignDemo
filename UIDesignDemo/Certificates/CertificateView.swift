//
//  CertificateView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CertificateView : View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.headline)
                        .fontWeight(.bold)
                        .color(.accent)
                    Text("Certificate")
                        .color(.white)
                }
                Spacer()
                Image.logo
                }
                .padding(.horizontal)
            Image.background
                .resizable()
                .frame(width: 340.0, height: 146)
            }
            .frame(width: 340.0, height: 220)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

#if DEBUG
struct CertificateView_Previews : PreviewProvider {
    static var previews: some View {
        CertificateView()
    }
}
#endif
