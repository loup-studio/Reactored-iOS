//
//  ReactorController.swift
//  Pods
//
//  Created by Lukasz on 30/08/2017.
//
//

import UIKit

class ReactorController<R: Reactor>: UIViewController {
    var reactor: R!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reactor.setUp(view: view as! R.View)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reactor.tearDown()
    }
}
