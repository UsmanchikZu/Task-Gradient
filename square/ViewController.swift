//
//  ViewController.swift
//  square
//
//  Created by aeroclub on 02.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let squareView: UIView = {
        let view = UIView()
        
        view.frame = CGRect(x: 100, y: 0, width: 150, height: 150)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        
        view.frame = CGRect(x: 100, y: 0, width: 150, height: 150)
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
        view.layer.shouldRasterize = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 15, height: 15)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = squareView.bounds
        gradient.colors = [UIColor.yellow.cgColor, UIColor.green.cgColor]
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [0.0, 1.0]
        gradient.opacity = 1.0
        gradient.cornerRadius = 10
        squareView.layer.insertSublayer(gradient, at: 0)
        
        setup()
    }
    
    func setup() {
        shadowView.addSubview(squareView)
        view.addSubview(shadowView)
        
        squareView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            squareView.widthAnchor.constraint(equalToConstant: 120),
            squareView.heightAnchor.constraint(equalToConstant: 120),
            
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shadowView.widthAnchor.constraint(equalToConstant: 120),
            shadowView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

