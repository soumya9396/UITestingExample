//
//  SecondViewController.swift
//  UITestingExample
//
//  Created by Soumitra Bera on 29/04/22.
//

import UIKit

class SecondViewController: UIViewController {

    private let titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Logged In Successfully"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.view.addSubview(titleLbl)
        self.addConstraint()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }

}
