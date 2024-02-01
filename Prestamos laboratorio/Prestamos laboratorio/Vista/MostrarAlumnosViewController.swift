//
//  MostrarAlumnosViewController.swift
//  Prestamos laboratorio
//
//  Created by Ios lab on 18/01/23.
//

import UIKit
import CoreData

class MostrarAlumnosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet var tabla: UITableView!
    
    var alumnos = [Alumno]()
    var fetchResultController : NSFetchedResultsController<Alumno>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabla.delegate = self
        tabla.dataSource = self
        mostrarAlumnos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tabla.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! DatosAlumnoTableViewCell
        let alumno = alumnos[indexPath.row]
        celda.numeroCuentaCelda.text = alumno.numero_cuenta
        celda.apellidoPaternoAlumno.text = alumno.apellido_paterno
        celda.apellidoMaternoAlumno.text = alumno.apellido_materno
        celda.nombreAlumno.text = alumno.nombre
        
        
        return celda
        //Me quedé en esta función, me falta poder unir en una misma variable el nombre completo del alumno
    }
    
    //Swipe Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let agregarPrestamo  = UIContextualAction(style: .normal, title: "Nuevo préstamo") { (_, _, _) in
            print("Agregando nuevo préstamo alumno")
            
        }
        agregarPrestamo.backgroundColor = .systemPurple
        
        return UISwipeActionsConfiguration(actions: [agregarPrestamo])
    }

    //Para ver informacion de los alumnos
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "verInformacionAlumno", sender: self)
    }
    
    //Para mandar la información del alumno seleccionado a la vista de Información de ese alumno
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verInformacionAlumno" {
            if let id = tabla.indexPathForSelectedRow{
                let fila = alumnos[id.row]
                //print(fila.nombre)
                let destino = segue.destination as! InformacionAlumnoViewController
                destino.alumnos = fila
            }
        }
    }
    
    
    //NSFETCHEDRESULT
    //Para mostrar datos
    func mostrarAlumnos(){
        let contexto = Estudiante.shared.contexto()
        let fetchRequest: NSFetchRequest<Alumno> = Alumno.fetchRequest()
        let ordenar = NSSortDescriptor(key: "apellido_paterno", ascending: true)
        fetchRequest.sortDescriptors = [ordenar]
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        do{
            try fetchResultController.performFetch()
            alumnos = fetchResultController.fetchedObjects!
        } catch let error as NSError {
            print("No se tienen alumnos registrados", error.localizedDescription)
        }
    }
    
    //Para llamar los datos en tiempo real
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tabla.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tabla.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            self.tabla.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            self.tabla.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            self.tabla.reloadRows(at: [indexPath!], with: .fade)
        default:
            self.tabla.reloadData()
        }
        self.alumnos = controller.fetchedObjects as! [Alumno]
    }
}
