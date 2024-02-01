//
//  ViewController.swift
//  LifeCycle
//
//  Created by Ios lab on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

     override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ViewController - View Did Load - La vista cargó")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - View Will Appear - La vista aparecerá")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController - View Will Appear - La vista apareció")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - View Will Appear - La vista desaparecerá")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View Controller - View Will Appear - La vista desapareció")
    }
}

