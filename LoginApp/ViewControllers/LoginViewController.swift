//
//  LoginViewController.swift
//  LoginApp
//
//  Created by MikhaiL on 04.04.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private var userNameTF: UITextField!
    @IBOutlet private var passwordTF: UITextField!
    
    private let name = "User"
    private let password = "123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = name
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction private func forgotAlert(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(name) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
    @IBAction private func loginButton() {
        guard userNameTF.text == name, passwordTF.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
