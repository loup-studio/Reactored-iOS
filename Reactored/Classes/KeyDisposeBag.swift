//
//  KeyDisposeBag.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import RxSwift

public final class KeyDisposeBag {
    
    private var disposables = [(String, Disposable)]()
    
    deinit {
        dispose()
    }
    
    public func put(disposable: Disposable, key: String = "") {
        if key != "" {
            dispose(by: key)
        }
        disposables.append((key, disposable))
    }
    
    public func dispose(by key: String) {
        if let index = disposables.index(where: { $0.0 == key }) {
            disposables[index].1.dispose()
            disposables.remove(at: index)
        }
    }
    
    public func dispose() {
        guard !disposables.isEmpty else { return }
        disposables.forEach { $0.1.dispose() }
        disposables.removeAll(keepingCapacity: false)
    }
    
}
