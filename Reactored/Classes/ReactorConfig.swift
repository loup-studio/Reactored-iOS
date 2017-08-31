//
//  ReactorConfig.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

public struct ReactorConfig {
    public enum Logging: Int {
        case none = 0, debug, trace
    }
    
    public static var logging: Logging = .none
    
    private init() {}
}
