//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Ios lab on 26/01/23.
//

import SwiftUI

struct CategoryItem: View {
    var landMark: Landmark
    
    var body: some View {
        VStack(alignment: .leading){
            landMark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(landMark.name)
                .font(.caption)
            //Con .primary el color se adecúa dependiendo la interfaz, es decir, modo claro u oscuro 
                .foregroundColor(.primary)
                
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landMark: ModelData().landMarks[0])
    }
}
