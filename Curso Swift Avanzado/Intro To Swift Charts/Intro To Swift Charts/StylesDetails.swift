//
//  StylesDetails.swift
//  Intro To Swift Charts
//
//  Created by Ios lab on 27/01/23.
//

import SwiftUI
import Charts

struct Pancakes: Identifiable {
    let name: String
    let sales: Int
    
    var id: String { name }
}

let sales: [Pancakes] = [
    .init(name: "Cachapa", sales: 916),
    .init(name: "Injera", sales: 850),
    .init(name: "Crepe", sales: 802),
    .init(name: "Jian Bing", sales: 753),
    .init(name: "Dosa", sales: 654),
    .init(name: "American", sales: 618),
]

struct StylesDetailsChart: View {
    var body: some View {
        Chart (sales) { element in
            BarMark (
                x: .value("Sales", element.sales),
                y: .value("Name", element.name)
            )
        }
    }
}

struct StylesDetails: View {
    var body: some View {
        StylesDetailsChart()
            .frame(height: 960)
            .
    }
}

struct StylesDetails_Previews: PreviewProvider {
    static var previews: some View {
        StylesDetails()
    }
}
