//
//  Log.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation

internal struct Log {
    
    static func d(_ message: String, state: Any? = nil) {
        guard ReactorConfig.logging.rawValue >= ReactorConfig.Logging.debug.rawValue else { return }
        
        if ReactorConfig.logging.rawValue >= ReactorConfig.Logging.trace.rawValue {
            t(message, state: state)
        } else {
            print(message)
        }
    }
    
    static func t(_ message: String, state: Any? = nil) {
        guard ReactorConfig.logging.rawValue >= ReactorConfig.Logging.trace.rawValue else { return }
        
        print(message)
        
        if let state = state {
            print("state: \(state)")
        }
    }
}
