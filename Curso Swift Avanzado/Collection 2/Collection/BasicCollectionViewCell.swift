//
//  BasicCollectionViewCell.swift
//  Collection
//
//  Created by IOSLAB INGENIERIA on 23/01/23.
//

import UIKit

//IBOutlet nunca se deben de dejar públicas, siempre deben de dejar privadas
//Collection View Flow Layout da las opciones de como se va a acomodar la información, por default esstá en 
class BasicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
}
