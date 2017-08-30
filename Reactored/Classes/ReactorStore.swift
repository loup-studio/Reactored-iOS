//
//  ReactorStore.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import Foundation
import RxSwift

class ReactorStore<State : ReactorState>: ObservableType {
    typealias E = State
    typealias Key = UInt
    typealias Mutation = (inout State) -> ()
    
    private var nextKey: Key = 0
    private var observers: [Key: (Event<State>) -> ()] = [:]
    private var _state: State!
    private var afterCommit: Mutation?
    
    var state: State {
        return _state!
    }
    
    required init(default state: State) {
        _state = state
        
        #if TRACE_RESOURCES
            _ = Resources.incrementTotal()
        #endif
    }
    
    
    deinit {
        afterCommit = nil
        Log.t("\(String(describing: type(of: self))): deinit")
        
        #if TRACE_RESOURCES
            _ = Resources.decrementTotal()
        #endif
    }
    
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == State {
        assertMainThread()
        
        let key = nextKey
        observers[key] = observer.on
        nextKey += 1
        
        observer.onNext(state)
        
        return Disposables.create { [weak self] in
            guard let `self` = self else { return }
            `self`.observers.removeValue(forKey: key)
        }
    }
    
    func commit(silently: Bool = false, _ mutation: Mutation) {
        Log.d("\(String(describing: type(of: self))): \(silently ? "commit silently" : "commit")")
        assertMainThread()
        var newState = _state!
        mutation(&newState)
        
        let isNewState = _state != newState
        _state = newState
        
        if !observers.isEmpty && !silently && isNewState {
            observers.values.forEach { $0(.next(state)) }
            
            if let commit = afterCommit {
                commit(&newState)
                _state = newState
            }
        }
    }
    
    func afterCommit(_ mutation: @escaping Mutation) {
        afterCommit = mutation
    }
    
    private func assertMainThread() {
        assert(Thread.isMainThread, "reactor store must be accessed from main thread")
    }
}
