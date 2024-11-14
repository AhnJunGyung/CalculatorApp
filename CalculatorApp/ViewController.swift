//
//  ViewController.swift
//  CalculatorApp
//
//  Created by t2023-m0072 on 11/14/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        
    }
    
    
}

