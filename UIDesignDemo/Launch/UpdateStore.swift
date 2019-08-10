//
//  UpdateStore.swift
//  UIDesignDemo
//
//  Created by 王洪运 on 2019/8/8.
//  Copyright © 2019 why. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    
    var objectWillChange = ObservableObjectPublisher()
    
    var updates: [Update] {
        didSet {
            objectWillChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
