//
//  DatosAlumnoTableViewCell.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 06/03/23.
//

import UIKit

class DatosAlumnoTableViewCell: UITableViewCell {

    @IBOutlet weak var numeroCuentaCelda: UILabel!
    @IBOutlet weak var apellidoPaternoAlumno: UILabel!
    @IBOutlet weak var apellidoMaternoAlumno: UILabel!
    @IBOutlet weak var nombreAlumno: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
