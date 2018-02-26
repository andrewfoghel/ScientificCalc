//
//  456Row.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class ThirdRow: UIView {
    let fourBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("4", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleFour), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleFour() {
        resultsLabel.appendNumberText(numberStr: "4")
    }
    
    let fiveBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("5", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleFive), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleFive() {
        resultsLabel.appendNumberText(numberStr: "5")
    }
    
    let sixBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("6", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSix), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSix() {
        resultsLabel.appendNumberText(numberStr: "6")
    }
    
    let minusBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleMinus), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleMinus() {
        guard let text = resultsLabel.text else { return }
        operationFlag = true
        if initialNumber != nil {
            secondNumber = Double(text)!
            initialNumber = initialNumber! - secondNumber!
            
            if floor(initialNumber!) == initialNumber! {
                resultsLabel.text = "\(Int(initialNumber!))"
            } else {
                resultsLabel.text = "\(initialNumber!)"
            }
        } else {
            initialNumber = Double(text)!
            resultsLabel.text = "0"
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(fourBtn)
        fourBtn.layer.cornerRadius = 10
        addSubview(fiveBtn)
        fiveBtn.layer.cornerRadius = 10
        addSubview(sixBtn)
        sixBtn.layer.cornerRadius = 10
        addSubview(minusBtn)
        minusBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [fourBtn, fiveBtn, sixBtn, minusBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
