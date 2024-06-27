//
//  ContentView.swift
//  ExploringSwiftCharts
//
//  Created by Sridhar Muthineni on 26/06/2024.
//

import SwiftUI
import Charts

struct Data: Identifiable {
    var id = UUID()
    var month: String
    var value: Int
}

struct ContentView: View {
    
    let data = [
        Data(month: "Jan", value: 100),
        Data(month: "Feb", value: 150),
        Data(month: "Mar", value: 130),
        Data(month: "Apr", value: 170)
    ]
    
    var body: some View {
        VStack {
            Spacer(minLength: 200)
            BarChartView(data: data)
            Spacer(minLength: 200)
        }
    }
}


struct BarChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            BarMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

struct LineChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            LineMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

struct AreaChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            AreaMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

struct PieChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            SectorMark(angle: .value("VALUE", item.value))
                .foregroundStyle(by: .value("Month", item.month))
        }
        .padding()
    }
}

struct DonutChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            SectorMark(angle: .value("VALUE", item.value),
                       innerRadius: .ratio(0.618),
                       outerRadius: .inset(10),
                       angularInset: 1)
            .cornerRadius(4)
            .foregroundStyle(by: .value("Month", item.month))
        }
        .padding()
    }
}

struct PointChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            PointMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

struct RectangleChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            RectangleMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

struct CombinedChartView: View {
    let data: [Data]
    
    var body: some View {
        Chart(data) { item in
            LineMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
            PointMark(
                x: .value("Month", item.month),
                y: .value("Value", item.value)
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
