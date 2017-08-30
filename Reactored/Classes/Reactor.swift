//
//  Reactor.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import RxSwift

protocol Reactor {
    associatedtype View: ReactorView
    
    var store: ReactorStore<View.State> { get }
    var disposeBag: KeyDisposeBag { get }
    
    func dispatch(action: View.Action)
}

extension Reactor {
    
    func setUp(view: View) {
        Log.t("\(String(describing: type(of: self))): set up")
        
        store
            .do(onNext: { Log.d("\(String(describing: type(of: self))): bind state", state: $0) })
            .subscribe(onNext: { view.bind(state: $0) })
            .disposed(by: disposeBag)
        
        view.actions()
            .do(onNext: { Log.d("\(String(describing: type(of: self))): action -> \($0)") })
            .subscribe(
                onNext: { self.dispatch(action: $0) },
                onError: { fatalError("error in mutation is not allowed (\($0))") }
            )
            .disposed(by: disposeBag)
    }
    
    func tearDown() {
        Log.t("\(String(describing: type(of: self))): tear down")
        disposeBag.dispose()
    }
}
