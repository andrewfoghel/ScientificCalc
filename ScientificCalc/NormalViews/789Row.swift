//
//  789Row.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class SecondRow: UIView {
    let sevenBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("7", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSeven), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSeven() {
        resultsLabel.appendNumberText(numberStr: "7")
    }
    
    let eightBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("8", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleEight), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleEight() {
        resultsLabel.appendNumberText(numberStr: "8")
    }
    
    let nineBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("9", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleNine), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleNine() {
        resultsLabel.appendNumberText(numberStr: "9")
    }
    
    let timesBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("x", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleTimes), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleTimes() {
        guard let text = resultsLabel.text else { return }
        operationFlag = true
        if initialNumber != nil {
            secondNumber = Double(text)!
            initialNumber = initialNumber! * secondNumber!
            
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
        
        addSubview(sevenBtn)
        sevenBtn.layer.cornerRadius = 10
        addSubview(eightBtn)
        eightBtn.layer.cornerRadius = 10
        addSubview(nineBtn)
        nineBtn.layer.cornerRadius = 10
        addSubview(timesBtn)
        timesBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [sevenBtn, eightBtn, nineBtn, timesBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}


