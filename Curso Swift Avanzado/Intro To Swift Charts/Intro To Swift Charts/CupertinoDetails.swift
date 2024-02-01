//
//  CupertinoDetails.swift
//  Intro To Swift Charts
//
//  Created by Ios lab on 27/01/23.
//

import SwiftUI
import Charts

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date { weekday }
}

func date(_ year: Int, _ month: Int, _ day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

let cupertinoData: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 54),
    .init(weekday: date(2022, 5, 3), sales: 42),
    .init(weekday: date(2022, 5, 4), sales: 88),
    .init(weekday: date(2022, 5, 5), sales: 49),
    .init(weekday: date(2022, 5, 6), sales: 42),
    .init(weekday: date(2022, 5, 7), sales: 125),
    .init(weekday: date(2022, 5, 8), sales: 67),
]

struct CupertinoDetails: View {
    var body: some View {
        Chart(cupertinoData) { element in
            BarMark (
                x: .value("Day", element.weekday, unit: .day),
                y: .value("Sales", element.sales)
            )
            .ForegroundStyle.yellow
        }
        .frame(height: 300)
        .padding()
    }
}

struct CupertinoDetails_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoDetails()
    }
}
