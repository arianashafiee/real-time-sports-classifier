//
//  AppConnectivityViewModel.swift
//  Real-time Sport Analyzer
//

import SwiftUI
import WatchConnectivity

final class AppConnectivityViewModel: NSObject, ObservableObject {
    private var session: WCSession = .default

    override init() {
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
}

extension AppConnectivityViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }

    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {}
}
