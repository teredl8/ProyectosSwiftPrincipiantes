//
//  LocationsToggle.swift
//  Intro To Swift Charts
//
//  Created by Ios lab on 27/01/23.
//

import SwiftUI
import Charts


let sfData: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 81),
    .init(weekday: date(2022, 5, 3), sales: 90),
    .init(weekday: date(2022, 5, 4), sales: 52),
    .init(weekday: date(2022, 5, 5), sales: 72),
    .init(weekday: date(2022, 5, 6), sales: 84),
    .init(weekday: date(2022, 5, 7), sales: 84),
    .init(weekday: date(2022, 5, 8), sales: 137),
]

enum City: String {
    case sanFrancisco
    case cupertino
}

struct LocationsToggleChart: View {
    @State private var city: City = .cupertino
    
    var body: some View {
        VStack {
            Picker("City", selection: $city) {
                Text("Cupertino")
                    .tag(City.cupertino)
                Text("San Francisco")
                    .tag(City.sanFrancisco)
            }
            .pickerStyle(.segmented)
            
            Chart(sfData) { element in
                BarMark (
                    x: .value("Day", element.weekday, unit: .day),
                    y: .value("Sales", element.sales)
                )
            }
        }
        .padding()
    }
}

struct LocationsToggle: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("Day + Location with most sales")
                .font(.headline)
            LocationsToggleChart()
                .frame(height: 300)
            Spacer()
        }
        .padding()
    }
}

struct LocationsToggle_Previews: PreviewProvider {
    static var previews: some View {
        LocationsToggle()
    }
}
