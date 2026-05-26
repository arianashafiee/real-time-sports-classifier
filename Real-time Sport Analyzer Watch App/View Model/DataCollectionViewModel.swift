//
//  DataCollectionViewModel.swift
//  Real-time Sport Analyzer Watch App
//

import SwiftUI
import CoreMotion

final class DataCollectionViewModel: NSObject, ObservableObject {
    @Published var status: String = "Idle"
    @Published var isCollecting: Bool = false
    @Published var motionData: [MotionDataModel] = []

    private let motionManager = CMMotionManager()
    private var currentActivity: String = ""

    func startCollectingData(for activity: String) {
        currentActivity = activity
        isCollecting = true
        motionData = []

        guard motionManager.isDeviceMotionAvailable else {
            status = "No Motion Data"
            return
        }

        motionManager.deviceMotionUpdateInterval = 1.0 / 50.0
        motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue.current!) { [weak self] data, _ in
            guard let self, let validData = data else { return }

            let record = MotionDataModel(
                activity: activity,
                accelX: validData.userAcceleration.x,
                accelY: validData.userAcceleration.y,
                accelZ: validData.userAcceleration.z,
                gyroX: validData.rotationRate.x,
                gyroY: validData.rotationRate.y,
                gyroZ: validData.rotationRate.z,
                magX: validData.magneticField.field.x,
                magY: validData.magneticField.field.y,
                magZ: validData.magneticField.field.z,
                pace: 0,
                stepCount: 0,
                cadence: 0
            )
            self.motionData.append(record)
        }

        status = "Collecting \(activity) data"
    }

    func stopCollectingData() {
        motionManager.stopDeviceMotionUpdates()
        isCollecting = false
        status = "Collection stopped"
    }
}
