//
//  Real_time_Sport_AnalyzerApp.swift
//  Real-time Sport Analyzer Watch App
//
//  Created by Ariana Shafiee on 5/21/26.
//

import SwiftUI

@main
struct Real_time_Sport_Analyzer_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                detectionViewModel: SportDetectionViewModel(),
                collectionViewModel: DataCollectionViewModel()
            )
        }
    }}
