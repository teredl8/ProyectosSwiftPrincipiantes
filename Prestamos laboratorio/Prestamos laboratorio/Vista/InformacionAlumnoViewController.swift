//
//  InformacionAlumnoViewController.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 28/02/23.
//

import UIKit

///Este es el controlador de la vista que muestra la información de un solo alumno

class InformacionAlumnoViewController: UIViewController {
    @IBOutlet var numeroCuenta: UILabel!
    @IBOutlet var apellidoPaterno: UILabel!
    @IBOutlet var apellidoMaterno: UILabel!
    @IBOutlet var nombre: UILabel!
    @IBOutlet var facultad: UILabel!
    @IBOutlet var carrera: UILabel!
    @IBOutlet var asignatura: UILabel!
    @IBOutlet var grupo: UILabel!
    
    var alumnos: Alumno?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numeroCuenta.text = alumnos?.numero_cuenta
        apellidoPaterno.text = alumnos?.apellido_paterno
        apellidoMaterno.text = alumnos?.apellido_materno
        nombre.text = alumnos?.nombre
        facultad.text = alumnos?.facultad
        carrera.text = alumnos?.carrera
        
        if ((alumnos?.asignatura == nil) || (alumnos?.asignatura == "")) {
            asignatura.text = "No hay asignatura registrada"
        }
        else {
            asignatura.text = alumnos?.asignatura
        }
        
        if (alumnos?.grupo == nil) {
            grupo.text = "No hay grupo registrado"
        }
        else {
            grupo.text = "1" //alumnos?.grupo
        }
    }
    

   

}
