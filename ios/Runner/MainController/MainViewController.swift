/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The view controller that selects an image and makes a prediction using Vision and Core ML.
 */

import UIKit
import SwiftUI

@available(iOS 13.0, *)
class MainViewController: UIViewController {
    @Published var predictionContents = ""
    let imagePredictor = ImagePredictor()
    let predictionsToShow = 2
}

@available(iOS 13.0, *)
extension MainViewController {
    public func classifyImage(_ image: UIImage) {
        do {
            try self.imagePredictor.makePredictions(for: image,
                                                    completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }
    private func imagePredictionHandler(_ predictions: [ImagePredictor.Prediction]?) {
        guard let predictions = predictions else {
            return
        }
        
        let formattedPredictions = formatPredictions(predictions)
        
        let predictionString = formattedPredictions.joined(separator: "\n")
        print("predictionString: \(predictionString)")
        self.predictionContents = predictionString
    }
    
    private func formatPredictions(_ predictions: [ImagePredictor.Prediction]) -> [String] {
        let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
            var name = prediction.classification
            if let firstComma = name.firstIndex(of: ",") {
                name = String(name.prefix(upTo: firstComma))
            }
            return "\(name) - \(prediction.confidencePercentage)%"
        }
        return topPredictions
    }
}
