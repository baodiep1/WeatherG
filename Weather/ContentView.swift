//
//  ContentView.swift
//  Weather
//
//  Created by BAO DIEP / ADAGE-147  on 6/10/2025.
//

import SwiftUI

struct ContentView: View {
    let weeklyForecast = [
        ("Mon", false, 70, 50),
        ("Tue", true, 60, 40),
        ("Wed", false, 80, 60),
        ("Thu", false, 90, 30),
        ("Fri", true, 40, 20),
        ("Sat", false, 85, 65),
        ("Sun", true, 55, 35)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(weeklyForecast, id: \.0) { day, isRainy, high, low in
                    DayForecast(day: day, isRainy: isRainy, iconColor: isRainy, high: high, low: low)
                }
            }
            .padding(.horizontal)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    
    let day: String
    let isRainy: Bool
    let iconColor: Bool
    let high: Int
    let low: Int
    
    var iconN: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconC: Color {
        if iconColor {
            return .blue
        } else {
            return .yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconN)
                .foregroundStyle(iconC)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(.bold)
            Text("Low: \(low)")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(minWidth: 80)
    }
}
