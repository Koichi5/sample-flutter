import UIKit
import Flutter
//import CoreTelephony
import CoreML
import Vision

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    // メソッドチャネルの定義
    private let methodChannelName = "com.example.flutter"
    public var result: FlutterResult?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: methodChannelName, binaryMessenger: controller as! FlutterBinaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] methodCall, result  in
            //Flutterで実行したinvokedMethodを受け取る処理
            methodChannel.setMethodCallHandler(handleMethodCall)
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

private func handleMethodCall(_ methodCall: FlutterMethodCall, _ result: @escaping FlutterResult) {
    switch methodCall.method {
    case "helloSwift":
        helloSwift(result)
    case "getTextLabelFromImage":
        guard let args = methodCall.arguments as? [String: String] else { return }
        let imageUrl = args["imageUrl"]!
        getTextLabelFromImage(result: result, imageUrl: imageUrl)
    default:
        result(FlutterMethodNotImplemented)
    }
}

private func helloSwift(_ result: @escaping FlutterResult) {
    result("Hello Flutter👋 \n This is Swift !")
}

private func getTextLabelFromImage(result: @escaping FlutterResult, imageUrl: String) {
    print("getTextLabelFromImage fired")

    // 非同期的に画像を取得する関数
    func getImageByUrl(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                print("Failed to load image: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }

    getImageByUrl(url: imageUrl) { image in
        guard let image = image else {
            result(FlutterError(code: "Error", message: "Could not download the image", details: nil))
            return
        }
        if #available(iOS 13.0, *) {
            let controller = MainViewController()
            controller.classifyImage(image)
            print("predictionContents: \(controller.predictionContents)")
            result(controller.predictionContents)
        } else {
            result(FlutterError(code: "Flutter Error", message: "Error", details: nil))
        }
    }
}
