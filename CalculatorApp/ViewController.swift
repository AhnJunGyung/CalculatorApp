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
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let buttonAdd = UIButton()
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        //라벨 속성
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        button7.setTitle("7", for: .normal)
        button8.setTitle("8", for: .normal)
        button9.setTitle("9", for: .normal)
        buttonAdd.setTitle("+", for: .normal)

        
        //버튼 속성
        [button7, button8, button9, buttonAdd]
            .forEach {
                $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
                $0.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                $0.frame.size.height = 80
                $0.frame.size.width = 80
                //$0.layer.cornerRadius = 40
        }
        
        [button7, button8, button9, buttonAdd].forEach {
            self.horizontalStackView.addArrangedSubview($0)
        }
        
        //stackView 속성
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.backgroundColor = .black
        horizontalStackView.distribution = .fillEqually
        
        
        [label, horizontalStackView]
            .forEach{ view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        horizontalStackView.snp.makeConstraints{
            $0.height.equalTo(80)
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    
    
}

