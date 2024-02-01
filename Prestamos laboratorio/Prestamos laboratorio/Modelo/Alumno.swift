//
//  Alumno.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 09/12/22.
//

import Foundation
import CoreData
import UIKit

class Estudiante {
    
    public static let shared = Estudiante()
    
    //Conexión con la base de datos
    func contexto() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func guardarInfoAlumno(numeroCuenta: String, apellidoPaterno: String, apellidoMaterno: String, nombre: String, facultad: String, carrera: String, asignatura: String, grupo: String) {
        let context = contexto()
        let entidadAlumno = NSEntityDescription.insertNewObject(forEntityName: "Alumno", into: context) as! Alumno
        entidadAlumno.numero_cuenta = numeroCuenta
        entidadAlumno.apellido_paterno = apellidoPaterno
        entidadAlumno.apellido_materno = apellidoMaterno
        entidadAlumno.nombre = nombre
        entidadAlumno.facultad = facultad
        entidadAlumno.carrera = carrera
        entidadAlumno.asignatura = asignatura
        entidadAlumno.grupo = grupo
        
        do{
            try context.save()
            print("Se guardó la información con éxito")
        } catch let error as NSError {
            print("No fue posible guardar la información", error.localizedDescription)
        }
        
    }
}
