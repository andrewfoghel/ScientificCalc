//
//  LastRow.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class LastRow: UIView {
    let zeroBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("0", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleZero), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleZero() {
        resultsLabel.appendNumberText(numberStr: "0")
    }
    
    let decimalBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle(".", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleDecimal), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleDecimal() {
        resultsLabel.appendNumberText(numberStr: ".")
    }
    
    let equalBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("=", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleEqual), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleEqual() {
        guard let text = resultsLabel.text else { return }
        var parsedString = text.replacingOccurrences(of: "^", with: "**") //Handle power funcs
        parsedString = text.replacingOccurrences(of: "e", with: " * 2.71828182846") //Handle natural exponent
        parsedString = text.replacingOccurrences(of: "π", with: " * 3.14159265359") //Handle pi
        parsedString = text.replacingOccurrences(of: "√", with: "sqrt") //Handle sqrt
        let num = NSExpression(format: parsedString).expressionValue(with: nil, context: nil) as? Double
        if num != nil {
            resultsLabel.text = "\(num!)"
        } else {
            resultsLabel.text = "Error"
        }
//        if secondNumber == nil {
//            guard let text = resultsLabel.text else { return }
//            secondNumber = Double(text)!
//        }
//        if secondNumber != nil && initialNumber != nil {
//            initialNumber = initialNumber! + secondNumber!
//            resultsLabel.text = "\(initialNumber!)"
//        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(zeroBtn)
        zeroBtn.layer.cornerRadius = 10
        addSubview(decimalBtn)
        decimalBtn.layer.cornerRadius = 10
        addSubview(equalBtn)
        equalBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [zeroBtn, decimalBtn, equalBtn])
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        addSubview(stackView)
        zeroBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.49).isActive = true
        decimalBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.22333).isActive = true
        equalBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.22333).isActive = true
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
