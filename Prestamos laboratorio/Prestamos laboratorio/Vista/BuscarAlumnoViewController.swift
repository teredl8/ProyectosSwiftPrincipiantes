//
//  BuscarAlumnoViewController.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 14/02/23.
//

import UIKit

class BuscarAlumnoViewController: UIViewController, UISearchResultsUpdating {
    
    
    @IBOutlet var Buscador: UISearchBar!
    
    //let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        searchController.searchResultsUpdater = self 
        navigationItem.searchController = searchController*/

        
    }
    /*
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }*/
    
    func updateSearchResults(for searchController: UISearchController) {
        return
    }

}
