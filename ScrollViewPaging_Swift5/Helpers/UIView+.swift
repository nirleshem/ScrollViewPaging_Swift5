//
//  UIView+.swift
//  PagingDemo
//
//  Created by Alex Nagy on 29/09/2020.
//

import UIKit

public extension UIView {
    func pinTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
    }
    
    func pinLeftButtonTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 20),
            heightAnchor.constraint(equalToConstant: 40.0),
            widthAnchor.constraint(equalToConstant: 40.0),
        ])
    }
    
    func pinRightButtonTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: -20),
            heightAnchor.constraint(equalToConstant: 40.0),
            widthAnchor.constraint(equalToConstant: 40.0),
        ])
    }
}
