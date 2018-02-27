//
//  ExpontentView.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class LogView: UIView {
    
    let natrualExponentBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("e", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleE), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleE() {
        resultsLabel.appendNumberText(numberStr: "e")
    }
    
    let naturlLogBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("ln", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleLn), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleLn() {
        resultsLabel.appendNumberText(numberStr: "ln(")
    }
    
    let logBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("log", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleLog), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleLog() {
        resultsLabel.appendNumberText(numberStr: "log(")
    }
    
    let inverseBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("inv", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleInv), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleInv() {
        print("inv Tap")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(natrualExponentBtn)
        natrualExponentBtn.layer.cornerRadius = 10
        addSubview(naturlLogBtn)
        naturlLogBtn.layer.cornerRadius = 10
        addSubview(logBtn)
        logBtn.layer.cornerRadius = 10
        addSubview(inverseBtn)
        inverseBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [natrualExponentBtn, naturlLogBtn, logBtn, inverseBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
