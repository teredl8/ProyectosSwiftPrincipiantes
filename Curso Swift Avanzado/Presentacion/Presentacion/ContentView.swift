//
//  ContentView.swift
//  Presentacion
//
//  Created by Ios lab on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotate = false
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.23)//También es una vista
            
            VStack (spacing: 50){
                Image("logoSwift")
                    .resizable()
                    .frame(width: rotate ? 150 : 100, height: rotate ? 150 : 100)
                    .clipShape(Circle())
                    .shadow(color: .blue, radius: 50, x: 0, y: 0)
                    .padding(50)
                    .rotationEffect(Angle(degrees: rotate ? 180 : 0))
                    .animation(.default, value: rotate)
                
                VStack (spacing: 10){
                    Text("Tere Durán")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .background(Color.white)
                        .clipShape(Capsule())
                    HStack(spacing: 20){
                        Text("Ciudad de México")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.indigo)
                        Text("🌄")
                    }
                }
                //Spacer()
                
                Button("Girar") {
                    rotate.toggle()
                }
                .foregroundColor(.white)
                .padding(20)
                .background(Color.blue)
                
            }
            .padding(80)
            //.frame(width: 10, height: 10)
        }
    }
}

//Con esta estructura es posible ver un preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
