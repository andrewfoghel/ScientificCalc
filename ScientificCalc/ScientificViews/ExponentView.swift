//
//  ExponentView.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class ExponentView: UIView {
    
    let factorialBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("x!", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleFactorial), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleFactorial() {
        guard let text = resultsLabel.text else { return }
        let num = Double(text)!
        initialNumber = findFactorial(decimalValue: num)
        resultsLabel.text = "\(initialNumber!)"
    }
    
    fileprivate func findFactorial(decimalValue: Double) -> Double {
        
        var inputDecimalValue = decimalValue
        var factorialValue = 1.0
        
        if inputDecimalValue.truncatingRemainder(dividingBy: 2.0) == 0 {
            
            while inputDecimalValue > 1 {
                
                factorialValue = factorialValue * inputDecimalValue
                inputDecimalValue = inputDecimalValue - 1
            }
            
            return factorialValue
            
        } else {
            return tgamma(inputDecimalValue + 1.0)
        }
    }
    
    let powerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("x^y", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handlePower), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlePower() {
        print("x^y Tap")
    }
    
    let sqrtBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("√", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSqrt), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSqrt() {
        guard let text = resultsLabel.text else { return }
        let num = Double(text)!
        initialNumber = sqrt(num)
        
        if floor(initialNumber!) == initialNumber! {
            resultsLabel.text = "\(Int(initialNumber!))"
        } else {
            resultsLabel.text = "\(initialNumber!)"
        }
    }
    
    let nSqrtBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("n√", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handlenSqrt), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlenSqrt() {
        print("nSqrt Tap")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(factorialBtn)
        factorialBtn.layer.cornerRadius = 10
        addSubview(powerBtn)
        powerBtn.layer.cornerRadius = 10
        addSubview(sqrtBtn)
        sqrtBtn.layer.cornerRadius = 10
        addSubview(nSqrtBtn)
        nSqrtBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [factorialBtn, powerBtn, sqrtBtn, nSqrtBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
