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
        
        //버튼별 색상 지정
        let numberButtonColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        let mathematicalSymbolButtonColor = UIColor(.orange)
        
        //hStackView1 버튼
        let buttonAc = makeButton(titleValue: "AC", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        let button0 = makeButton(titleValue: "0", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let buttonEqual = makeButton(titleValue: "=", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        let buttonDiv = makeButton(titleValue: "/", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        
        //hStackView2 버튼
        let button1 = makeButton(titleValue: "1", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button2 = makeButton(titleValue: "2", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button3 = makeButton(titleValue: "3", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let buttonMul = makeButton(titleValue: "*", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        
        //hStackView3 버튼
        let button4 = makeButton(titleValue: "4", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button5 = makeButton(titleValue: "5", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button6 = makeButton(titleValue: "6", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let buttonSub = makeButton(titleValue: "-", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        
        //hStackView4 버튼
        let button7 = makeButton(titleValue: "7", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button8 = makeButton(titleValue: "8", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let button9 = makeButton(titleValue: "9", action: #selector(buttonTapped), backgroundColor: numberButtonColor)
        let buttonAdd = makeButton(titleValue: "+", action: #selector(buttonTapped), backgroundColor: mathematicalSymbolButtonColor)
        
        
        //horizontalStackView
        let hStackView1 = makeHorizontalStackView([buttonAc, button0, buttonEqual, buttonDiv])
        let hStackView2 = makeHorizontalStackView([button1, button2, button3, buttonMul])
        let hStackView3 = makeHorizontalStackView([button4, button5, button6, buttonSub])
        let hStackView4 = makeHorizontalStackView([button7, button8, button9, buttonAdd])
        
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
        
        //라벨 제약조건
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
        
        //hotizontal 스택 제약조건
        [hStackView4, hStackView3, hStackView2, hStackView1].forEach{
            $0.snp.makeConstraints{$0.height.equalTo(80)}
        }
        
        //vertical 스택 제약조건
        vStackView.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(350)
        }
        
    }
    
    /*
     @objc: swift에서 작성된 메소드를 Objective-C에서 호출될 수 있도록 하는 역할(Swift 메서드가 Objective-C 런타임에서 호출 가능한 메서드로 인식)
     Objective-C는 selector를 통해 메소드를 호출(selector는 #selector() 메소드를 통해 인스턴스를 생성)
     */
    @objc
    private func buttonTapped(_ sender: UIButton) {//버튼을 탭 했을때의 기능 처리
        
        if let buttonLabel = sender.titleLabel?.text {
            
            switch buttonLabel {
            case "AC": label.text = "0" //0으로 초기화
                
            case "=": if let labelText = label.text {
                let labelArray = Array(labelText)
                
                //수식의 마지막 값이 연산기호가 아닌 경우
                if !mathematicalSymbolCheck(labelArray[labelArray.endIndex - 1]) {
                    if let result = calculate(expression: labelText) {//연산 수행
                        label.text = String(result)
                    }
                }
            }
                
            case "*": inputMathematicalSymbol(buttonLabel)
            case "+": inputMathematicalSymbol(buttonLabel)
            case "-": inputMathematicalSymbol(buttonLabel)
            case "/": inputMathematicalSymbol(buttonLabel)
            default: inputNumber(buttonLabel)
            }
            
        }
        
    }
    
    //탭한 버튼값 입력 처리
    private func inputNumber(_ getString: String) {
        
        if let labelText = label.text {
            let labelArray = Array(labelText)
            
            if labelArray[0] == "0" && labelArray.count == 1 {//초기값이 0일 경우 입력 숫자로 덮어쓰기
                label.text = getString
            } else if labelArray[labelArray.endIndex - 1] != "0"{//일반적인 입력값 추가
                label.text?.append(getString)
            } else {
                //수식의 마지막이 0일 경우 getString으로 대체
                var characterArray = Array(labelArray)
                characterArray[characterArray.endIndex - 1] = Character(getString)
                label.text = String(characterArray)
            }
        }
        
    }
    
    //연산기호 입력
    private func inputMathematicalSymbol(_ getString: String) {
        
        if let labelText = label.text {
            
            let labelArray = Array(labelText)
            let arrayLast = labelArray[labelArray.endIndex - 1]

            //수식의 마지막이 연산기호가 아닌 경우, 연산기호 append
            if arrayLast != "*" && arrayLast != "+" && arrayLast != "/" && arrayLast != "-" {
                label.text?.append(getString)
            } else {
                //수식의 마지막이 연산기호인 경우 입력된 연산기호로 대체
                var characterArray = Array(labelArray)
                characterArray[characterArray.endIndex - 1] = Character(getString)
                label.text = String(characterArray)
            }
            
        }
    }
    
    //연산 수행
    private func calculate(expression: String) -> Int? {
        
        let expression = NSExpression(format: expression)
        
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
        
    }
    
    //연산기호 체크 함수. 연산기호인 경우 true
    private func mathematicalSymbolCheck(_ getCharacter: Character) -> Bool{
        
        return getCharacter == "*" || getCharacter == "/" || getCharacter == "+" || getCharacter == "-"
        
    }
    
    //버튼 생성
    private func makeButton(titleValue: String, action: Selector, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
                
        button.setTitle(titleValue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.frame.size.height = 80
        button.frame.size.width = 80
        button.layer.cornerRadius = 40
        button.addTarget(self, action: action, for: .touchDown)
        button.backgroundColor = backgroundColor
        
        return button
    }
    
    //horizontalStack생성
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
        let horizontalStackView = UIStackView()
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.backgroundColor = .black
        horizontalStackView.distribution = .fillEqually
        
        for i in 0..<views.count {
            horizontalStackView.addArrangedSubview(views[i])
        }
        
        return horizontalStackView
    }
    
}

