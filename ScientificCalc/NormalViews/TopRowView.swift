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
        print("AC Tap")
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
        print("+/- Tap")
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
        print("% Tap")
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
        print("/ Tap")
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
