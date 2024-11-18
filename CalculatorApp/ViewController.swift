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
    
    let buttonAc = UIButton()
    let button0 = UIButton()
    let buttonEqual = UIButton()
    let buttonDiv = UIButton() //Divide 나누기
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let buttonMul = UIButton() //Multiple 곱하기
    
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let buttonSub = UIButton() //Subtraction 빼기
    
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let buttonAdd = UIButton() //Addition 더하기
    
    //horizontalStackView
    let hStackView1 = UIStackView()
    let hStackView2 = UIStackView()
    let hStackView3 = UIStackView()
    let hStackView4 = UIStackView()
    
    //verticalStackView
    let vStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        //라벨 속성
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        
        //버튼속성
        //hStackView1 버튼
        buttonAc.setTitle("AC", for: .normal)
        button0.setTitle("0", for: .normal)
        buttonEqual.setTitle("=", for: .normal)
        buttonDiv.setTitle("/", for: .normal)
        
        //hStackView2 버튼
        button1.setTitle("1", for: .normal)
        button2.setTitle("2", for: .normal)
        button3.setTitle("3", for: .normal)
        buttonMul.setTitle("*", for: .normal)
        
        //hStackView3 버튼
        button4.setTitle("4", for: .normal)
        button5.setTitle("5", for: .normal)
        button6.setTitle("6", for: .normal)
        buttonSub.setTitle("-", for: .normal)
        
        //hStackView4 버튼
        button7.setTitle("7", for: .normal)
        button8.setTitle("8", for: .normal)
        button9.setTitle("9", for: .normal)
        buttonAdd.setTitle("+", for: .normal)
        
        
        //버튼 속성
        [button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonAdd, buttonSub, buttonMul, buttonEqual, buttonAc, buttonDiv]
            .forEach {
                //버튼 컬러 지정
                if let text = $0.titleLabel?.text {
                    if let _ = Int(text) {
                        $0.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
                    } else {
                        $0.backgroundColor = .orange
                    }
                }
                
                $0.titleLabel?.font = .boldSystemFont(ofSize: 30)
                $0.frame.size.height = 80
                $0.frame.size.width = 80
                $0.layer.cornerRadius = 40
                $0.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
            }
        
        //버튼 스택뷰에 추가
        [button7, button8, button9, buttonAdd].forEach {
            self.hStackView4.addArrangedSubview($0)
        }
        
        [button4, button5, button6, buttonSub].forEach {
            self.hStackView3.addArrangedSubview($0)
        }
        
        [button1, button2, button3, buttonMul].forEach {
            self.hStackView2.addArrangedSubview($0)
        }
        
        [buttonAc, button0, buttonEqual, buttonDiv].forEach {
            self.hStackView1.addArrangedSubview($0)
        }
        
        
        //stackView 속성
        [hStackView1, hStackView2, hStackView3, hStackView4]
            .forEach{
                $0.axis = .horizontal
                $0.spacing = 10
                $0.backgroundColor = .black
                $0.distribution = .fillEqually
            }
        
        vStackView.axis = .vertical
        vStackView.backgroundColor = .black
        vStackView.spacing = 10
        vStackView.distribution = .fillEqually
        
        //뷰 컨트롤러에 UI 추가
        [label].forEach{ view.addSubview($0) }
        
        [hStackView4, hStackView3, hStackView2, hStackView1].forEach{
            vStackView.addArrangedSubview($0) //vertical스택뷰에 horizontal스택뷰 추가
        }
        
        view.addSubview(vStackView) //뷰컨트롤러에 vertical스택뷰 추가
        
        
        //제약조건
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        [hStackView4, hStackView3, hStackView2, hStackView1].forEach{
            $0.snp.makeConstraints{$0.height.equalTo(80)}
        }
        
        vStackView.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(350)
        }
        
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {//탭한 버튼에 따라 처리
        if let buttonLabel = sender.titleLabel?.text {
            switch buttonLabel {
            case "AC": label.text = "0" //0으로 초기화
            case "=": changeLabelText(buttonLabel)
            case "*": changeLabelText(buttonLabel)
            case "+": changeLabelText(buttonLabel)
            case "-": changeLabelText(buttonLabel)
            case "/": changeLabelText(buttonLabel)
            default: changeLabelText(buttonLabel)
            }
        }
        
    }
    
    private func changeLabelText(_ getString: String) {
        
        if let labelText = label.text {
            if Array(labelText)[0] == "0" {//label의 첫번째 값이 0일 경우 입력값으로 덮어쓰기
                label.text = getString
            } else {//label의 첫번째 값이 0이 아닐 경우 입력값 추가
                label.text?.append(getString)
            }
        }
    }
    
    
}

