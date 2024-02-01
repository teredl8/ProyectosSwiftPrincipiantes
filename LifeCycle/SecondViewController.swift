//
//  SecondViewController.swift
//  LifeCycle
//
//  Created by Ios lab on 07/09/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("SecondViewController - View Did Load - La vista cargó")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController - View Will Appear - La vista aparecerá")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController - View Will Appear - La vista apareció")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController - View Will Appear - La vista desaparecerá")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController - View Will Appear - La vista desapareció")
    }

}
