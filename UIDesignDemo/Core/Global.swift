//
//  Global.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/10.
//  Copyright © 2019 why. All rights reserved.
//

import Foundation
import SwiftUI

var screen = UIScreen.main.bounds

var statusBarH: CGFloat {
  return UIStatusBarManager
    .foregroundActive?.statusBarFrame.size.height ?? 0
}

