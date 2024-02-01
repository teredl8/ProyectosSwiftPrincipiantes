//
//  ModelData.swift
//  Landmarks
//
//  Created by Ios lab on 25/01/23.
//

import Foundation

//Con final nadie más podrá heredar de esta clase
//Como buena práctica una ObservableObject se define como final 
final class ModelData: ObservableObject {
    @Published var landMarks: [Landmark] = load("landmarkData.json")
    
    //Creando diccionarios
    var categories: [String: [Landmark]] {
        Dictionary (
            grouping: landMarks, by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landMarks.filter({ $0.isFeatured })
    }
}

//var landMarks: [Landmark] = load("landmarkData.json")

//Función genérica
//También se podía escribir como la siguiente línea
//func load<T>(_ fileName: String) -> T where T : Decodable {
func load<T: Decodable>(_ fileName: String) -> T {
    
    //1. Leemos el archivo
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("No se encontró el siguiente nombre de archivo \(fileName)")
    }
    
    //2. Cargamos la data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("No se pudo cargar la data: \(error)")
    }
    
    //3. Decodificamos
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("No se pudi decodificar la información comio \(T.self):\(error)")
    }
}
