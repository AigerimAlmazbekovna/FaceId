//
//  ViewController.swift
//  FaceIDAigerimHomework
//
//  Created by Айгерим on 18.10.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func authFaceID() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please autorize with Face ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        self.statusLabel.text = "Your biometric status Faild"
                        self.statusLabel.textColor = .red
                        self.showAlert(title: "Error", message: "Try again")
                        return
                    }
                    self.statusLabel.text = "Your biometric status log in"
                    self.statusLabel.textColor = .green
                }
            }
        } else {
            if let error {
                showAlert(title: "Net dannyh", message: "\(error.localizedDescription)")
            }
            }
        }
    }

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dissmis = UIAlertAction(title: "OTMENA", style: .cancel)
        alert.addAction(dissmis)
        present(alert, animated: true)
    }
}
