//
//  ContentView.swift
//  RoutineLog
//
//  Created by Acoman on 1.06.2026.
//

import SwiftUI

struct ContentView: View {
    
    enum TabIdentifier {
        case dashboard, history, settings, statistics
    }
    
    
    @State private var selectedTab: TabIdentifier = .dashboard
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack{
                DashboardView()
            }
            .tabItem {
                Label("Today", systemImage: "house")
            }
            .tag(TabIdentifier.dashboard) // dashboard tab
            
            NavigationStack {
                HistoryView()
            }
            .tabItem{
                Label("History", systemImage: "clock.arrow.circlepath")
            }
            .tag(TabIdentifier.history)// history tab
            
            NavigationStack{
                StatisticsView()
            }
            .tabItem {
                Label("Statistics", systemImage: "chart.bar")
            }
            .tag(TabIdentifier.statistics) // statistics tab
            
            NavigationStack{
                SettingsView()
            }
            .tabItem{
                Label("Settings", systemImage: "gearshape")
            }
            .tag(TabIdentifier.settings) // settings tab
        }
    }
}

#Preview {
    ContentView()
}
