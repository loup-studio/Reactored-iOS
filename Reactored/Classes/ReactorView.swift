//
//  ReactorView.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import UIKit
import RxSwift

protocol ReactorView {
    associatedtype Action
    associatedtype State: ReactorState
    
    func bind(state: State)
    func actions() -> Observable<Action>
}

//extension ReactorView {
//    
//    func bind(state: State, if isActive: Bool) {
//        if isActive {
//            bind(state: state)
//        }
//    }
//}
