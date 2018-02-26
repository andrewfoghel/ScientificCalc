//
//  TrigView.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class TrigView: UIView {
    
    let sinBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("sin", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSin), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSin() {
        print("Sin Tap")
    }
    
    let cosBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("cos", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleCos), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleCos() {
        print("Cos Tap")
    }
    
    let tanBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("tan", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleTan), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleTan() {
        print("Tan Tap")
    }
    
    let secBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("sec", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSec), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSec() {
        print("Sec Tap")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(sinBtn)
        sinBtn.layer.cornerRadius = 10
        addSubview(cosBtn)
        cosBtn.layer.cornerRadius = 10
        addSubview(tanBtn)
        tanBtn.layer.cornerRadius = 10
        addSubview(secBtn)
        secBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [sinBtn, cosBtn, tanBtn, secBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
