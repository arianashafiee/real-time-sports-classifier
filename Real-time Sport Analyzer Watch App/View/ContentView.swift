//
//  ContentView.swift
//  Real-time Sport Analyzer Watch App
//

import SwiftUI

struct ContentView: View {
    @StateObject private var collectionViewModel = DataCollectionViewModel()

    var body: some View {
        DataCollectionView(viewModel: collectionViewModel)
    }
}
