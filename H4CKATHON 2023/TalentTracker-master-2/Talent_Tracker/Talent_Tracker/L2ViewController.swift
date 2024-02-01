//
//  L2ViewController.swift
//  Talent_Tracker
//
//  Created by Sara Miranda on 11/05/23.
//

import UIKit
import Firebase
class L2ViewController: UIViewController {
    
    @IBOutlet weak var user: UITextField!
    
    @IBOutlet weak var psw: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BPressed(_ sender: Any) {
        guard let usr = user.text else {return}
        guard let password = psw.text else {return}
        Auth.auth().createUser(withEmail: usr, password: password)
        {
            firebaseResult, error in
            if let e = error {
                print("error")
            }
            else
            {
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
