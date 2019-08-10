//
//  CertificateRow.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/10.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    
    var certificates = certificateData
    
    var body: some View {
        VStack {
            Text("Certificates")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 40)
        
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) { item in
                        CertificateView(title: item.title, image: item.image)
                            .frame(width: item.width, height: item.height)
                            .shadow(color: Color.buttonShadow, radius: 10)
                    }
                }
                .padding(.leading, 30)
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

#if DEBUG
struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}
#endif

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
    var width: CGFloat
    var height: CGFloat
}

let certificateData = [
    Certificate(title: "UI Design", image: .certificate1, width: 300, height: 350),
    Certificate(title: "SwiftUI", image: .certificate2, width: 300, height: 350),
    Certificate(title: "Sketch", image: .certificate3, width: 300, height: 350),
    Certificate(title: "Framer", image: .certificate4, width: 300, height: 350)
]
