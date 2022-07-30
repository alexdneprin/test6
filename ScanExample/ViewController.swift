//
//  ViewController.swift
//  ScanExample
//
//  Created by Oleksandr Slobodianiuk on 14.07.2022.
//

import UIKit
import WeScan

class ViewController: UIViewController, ImageScannerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scannerViewController = ImageScannerController()
        scannerViewController.imageScannerDelegate = self
        scannerViewController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency

        present(scannerViewController, animated: true)
    }

    func imageScannerController(_ scanner: ImageScannerController, didFailWithError error: Error) {
        // You are responsible for carefully handling the error
        print(error)
    }

    func imageScannerController(_ scanner: ImageScannerController, didFinishScanningWithResults results: ImageScannerResults) {
        // The user successfully scanned an image, which is available in the ImageScannerResults
        // You are responsible for dismissing the ImageScannerController
        scanner.dismiss(animated: true)
    }

    func imageScannerControllerDidCancel(_ scanner: ImageScannerController) {
        // The user tapped 'Cancel' on the scanner
        // You are responsible for dismissing the ImageScannerController
        scanner.dismiss(animated: true)
    }
}

