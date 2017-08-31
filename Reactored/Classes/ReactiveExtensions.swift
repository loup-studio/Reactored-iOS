//
//  ReactiveExtensions.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import RxSwift

extension Disposable {
    public func disposed(by bag: KeyDisposeBag, key: String = "") {
        bag.put(disposable: self, key: key)
    }
}
