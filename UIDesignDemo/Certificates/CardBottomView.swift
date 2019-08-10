//
//  CardBottomView.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/7/11.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI

struct CardBottomView : View {
  var body: some View {
    VStack(spacing: 20) {
      Rectangle()
        .frame(width: 60, height: 6)
        .cornerRadius(3.0)
        .opacity(0.1)
      Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
        .lineLimit(10)
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .padding()
    .padding(.horizontal)
    .background(Color.white)
    .cornerRadius(30)
    .shadow(radius: 20)
    .offset(y: screen.height - 170)
  }
}

#if DEBUG
struct CardBottomView_Previews : PreviewProvider {
  static var previews: some View {
    CardBottomView()
  }
}
#endif
