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

extension ObservableType {
    
    public func commit<S: ReactorState>(into store: ReactorStore<S>, silently: Bool = false, reducer: @escaping (inout S, E) -> ()) -> Disposable {
        return subscribe(onNext: { element in
            store.commit(silently: silently) { state in
                reducer(&state, element)
            }
        })
    }
}

extension PrimitiveSequenceType where TraitType == SingleTrait {
    
    public func commit<S: ReactorState>(into store: ReactorStore<S>, silently: Bool = false, reducer: @escaping (inout S, ElementType) -> ()) -> Disposable {
        
        return subscribe(onSuccess: { element in
            store.commit(silently: silently) { state in
                reducer(&state, element)
            }
        })
    }
}
