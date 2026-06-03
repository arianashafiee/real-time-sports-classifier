# Real-time Sport Analyzer

Apple Watch app that classifies basketball vs soccer from motion sensor data, with an iPhone companion for collecting training data.

## Targets
- **Watch app** — live sport detection and labeled data collection
- **iPhone app** — receives CSV batches from the watch via WatchConnectivity

## Setup
Open `Real-time Sport Analyzer.xcodeproj` in Xcode 15+ and run on paired iPhone + Apple Watch simulators or devices.

## Model training
Use `SportsClassifier.ipynb` to preprocess 10-second sensor windows, engineer statistical features, and export a Core ML model for on-watch inference.
