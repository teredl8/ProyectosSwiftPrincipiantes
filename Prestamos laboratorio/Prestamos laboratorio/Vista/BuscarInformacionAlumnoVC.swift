//
//  BuscarInformacionAlumnoVC.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 12/01/23.
//

import UIKit

class BuscarInformacionAlumnoVC: UIViewController, UISearchResultsUpdating{
    
    let controladorBusqueda = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()

        controladorBusqueda.searchResultsUpdater = self
        navigationItem.searchController = controladorBusqueda
        // Do any additional setup after loading the view.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = controladorBusqueda.searchBar.text else {
            return
        }
        print(text)
    }
    

    

}
