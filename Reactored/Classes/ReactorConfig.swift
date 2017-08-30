//
//  ReactorConfig.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

public struct ReactorConfig {
    enum Logging: Int {
        case none = 0, debug, trace
    }
    
    static var logging: Logging = .none
    
    private init() {}
}
