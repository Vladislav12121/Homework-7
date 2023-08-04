//
//  LoginViewController.swift
//  Homework 7
//
//  Created by Владислав Клунный on 04.08.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private var user = User.getUserInformation()
  
    @IBAction func forgotLogInPressed() {
        showAlert(with: "Oops!", andMessage: "Your name is User")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(with: "Oops!", andMessage: "Your password is Hey")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? HomeViewController {
                welcomeVC.showNameTF = user.person.name
            } else if let homeVC = viewController as? UINavigationController {
                guard let HomeVCC = homeVC.topViewController as? UserViewController else { return }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButton() {
        if userNameTF.text == user.login, passwordTF.text == user.password {
        } else {
            showAlert(with: "Invalid login of password", andMessage: "Please enter correct login and message")
        }
        performSegue(withIdentifier: "showHomeVC", sender: nil)
    }
}
    
extension LoginViewController {
    private func showAlert(with title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


