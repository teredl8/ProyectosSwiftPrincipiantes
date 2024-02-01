//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ios lab on 25/01/23.
//

import SwiftUI

//Punto inicial de la aplicación 
@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
