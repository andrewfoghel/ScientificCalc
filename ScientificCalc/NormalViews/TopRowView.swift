//
//  ExtrasView.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class TopRowView: UIView {
    
    let clearBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("AC", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleClear() {
        initialNumber = nil
        secondNumber = nil
        resultsLabel.text = "0"
    }
    
    let posNegBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("+/-", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handlePosNeg), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlePosNeg() {
        guard let text = resultsLabel.text else { return }
        if let num = secondNumber {
            secondNumber = -num
        }
        if resultsLabel.text?.first == "-" {
            resultsLabel.text?.remove(at: resultsLabel.text!.startIndex)
        } else {
            resultsLabel.text?.insert("-", at: resultsLabel.text!.startIndex)
        }
    }
    
    let modBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("%", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleMod), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleMod() {
        resultsLabel.appendNumberText(numberStr: " % ")
//        guard let text = resultsLabel.text else { return }
//        operationFlag = true
//        if initialNumber != nil {
//            secondNumber = Double(text)!
//            initialNumber = initialNumber!.truncatingRemainder(dividingBy: secondNumber!)
//
//            if floor(initialNumber!) == initialNumber! {
//                resultsLabel.text = "\(Int(initialNumber!))"
//            } else {
//                resultsLabel.text = "\(initialNumber!)"
//            }
//        } else {
//            initialNumber = Double(text)!
//            resultsLabel.text = "0"
//        }
    }
    
    let divideBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("/", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleDivide), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleDivide() {
        resultsLabel.appendNumberText(numberStr: " / ")
//        guard let text = resultsLabel.text else { return }
//        operationFlag = true
//        if initialNumber != nil {
//            secondNumber = Double(text)!
//            initialNumber = initialNumber! / secondNumber!
//
//            if floor(initialNumber!) == initialNumber! {
//                resultsLabel.text = "\(Int(initialNumber!))"
//            } else {
//                resultsLabel.text = "\(initialNumber!)"
//            }
//        } else {
//            initialNumber = Double(text)!
//            resultsLabel.text = "0"
//        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(clearBtn)
        clearBtn.layer.cornerRadius = 10
        addSubview(posNegBtn)
        posNegBtn.layer.cornerRadius = 10
        addSubview(modBtn)
        modBtn.layer.cornerRadius = 10
        addSubview(divideBtn)
        divideBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [clearBtn, posNegBtn, modBtn, divideBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
