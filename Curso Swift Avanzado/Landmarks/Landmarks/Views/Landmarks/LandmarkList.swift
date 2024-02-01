//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ios lab on 26/01/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landMarks.filter { landmark in
            (landmark.isFavorite || !showFavoritesOnly)
        }
    }
    
    var body: some View {
        NavigationView {
            //Se especifica que el id nos va a ayudar a mostrar todos los elementos
            List {
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {
                    landmark in
                    
                    NavigationLink {
                        //A dónde quiero ir
                        LandmarkDetail(landmark: landmark)
                    } label : {
                        //Qué es lo que se quiere renderizar
                        LandmarkRowView(landmark: landmark)
                    }
                }
                
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(modelData)
            
        //Para ver en varios dispositivos al mismo tiempo
        /*
        ForEach(["iPhone SE (3rd generation)", "iPhone 13", "iPad mini (6th generation)"], id: \.self) {
            deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
         */
        
    }
}
