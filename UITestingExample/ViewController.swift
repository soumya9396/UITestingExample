//
//  ViewController.swift
//  UITestingExample
//
//  Created by Soumitra Bera on 29/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let userNameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.backgroundColor = .secondarySystemBackground
        field.font = .systemFont(ofSize: 20, weight: .medium)
        field.layer.cornerRadius = 8
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 0.5
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.backgroundColor = .secondarySystemBackground
        field.font = .systemFont(ofSize: 20, weight: .medium)
        field.layer.cornerRadius = 8
        field.layer.borderColor = UIColor.gray.cgColor
        field.layer.borderWidth = 0.5
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        field.leftViewMode = .always
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(titleLbl)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueButtonTaped(_:)), for: .touchUpInside)
        self.addConstraint()
    }

    private func addConstraint() {
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userNameTextField.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            
            continueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 270),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc private func continueButtonTaped(_ sender: UIButton) {
        if userNameTextField.text == "" && passwordTextField.text == "" {
            self.alertPopUp(title: "Warning!", message: "Field can not be empty.")
        } else if userNameTextField.text == "Soumitra" && passwordTextField.text == "123456"{
            //self.alertPopUp(title: "Logged In", message: "Successfull")
            self.performSegue(withIdentifier: "SecondViewController", sender: nil)
        } else {
            self.alertPopUp(title: "Error!", message: "Username or password did not match.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondViewController" {
            let destination = segue.destination
            debugPrint(destination)
        }
    }
    
    private func alertPopUp(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
}

