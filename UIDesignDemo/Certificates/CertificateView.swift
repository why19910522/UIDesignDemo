//
//  CertificateView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CertificateView : View {
    
    let title: String
    let image: Image
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.accent)
                    Text("Certificate")
                        .foregroundColor(.white)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 20)
                .padding(.leading, 20)
                
                Spacer().frame(minWidth: 0)
                
                Image.logo
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)
                }
                .padding(.horizontal)
            
            image
                .resizable()
                .renderingMode(.original)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: 200)
                .offset(y: 50)
            }
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

#if DEBUG
struct CertificateView_Previews : PreviewProvider {
    static var previews: some View {
        CertificateView(title: "UI Design", image: Image.certificate1)
    }
}
#endif
