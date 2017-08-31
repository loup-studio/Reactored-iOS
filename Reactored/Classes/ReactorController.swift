//
//  ReactorController.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import UIKit

open class ReactorController<R: Reactor>: UIViewController {
    
    public var reactor: R!
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reactor.setUp(view: view as! R.View)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reactor.tearDown()
    }
}
