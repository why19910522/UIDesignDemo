//
//  UIWindowSceneExtension.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/10.
//  Copyright © 2019 why. All rights reserved.
//

import Foundation
import SwiftUI

extension UIWindowScene {
  
  static var foregroundActive: UIWindowScene? {
    return UIApplication.shared.connectedScenes
      .filter({$0.activationState == .foregroundActive})
      .compactMap({$0 as? UIWindowScene}).first
  }
  
}
