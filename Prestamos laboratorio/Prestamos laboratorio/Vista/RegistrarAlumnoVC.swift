//
//  RegistrarAlumnoVC.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 09/12/22.
//

import UIKit

class RegistrarAlumnoVC: UIViewController {

    @IBOutlet var numeroCuenta: UITextField!
    @IBOutlet var apellidoPaterno: UITextField!
    @IBOutlet var apellidoMaterno: UITextField!
    @IBOutlet var nombre: UITextField!
    @IBOutlet var facultad: UITextField!
    @IBOutlet var carrera: UITextField!
    @IBOutlet var asignatura: UITextField!
    @IBOutlet var grupo: UITextField!
    @IBOutlet var credencialFrente: UIButton!
    @IBOutlet var credencialAtras: UIButton!
    @IBOutlet var firma: UIButton!
    @IBOutlet var guardarAlumno: UIButton!

    var alumnos: Alumno?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
 
    @IBAction func guardarInformacionAlumno(_ sender: UIButton) {
        Estudiante.shared.guardarInfoAlumno(numeroCuenta: numeroCuenta.text ?? "", apellidoPaterno: apellidoPaterno.text ?? "", apellidoMaterno: apellidoMaterno.text ?? "", nombre: nombre.text ?? "", facultad: facultad.text ?? "", carrera: carrera.text ?? "", asignatura: asignatura.text ?? "", grupo: grupo.text ?? "")
        //Para que al guardar la información automáticamente se vaya a la pantalla anterior
        navigationController?.popViewController(animated: true)
    }
    
}

