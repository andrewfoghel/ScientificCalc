//
//  123Row.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class FourthRow: UIView {
    let oneBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("1", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleOne), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleOne() {
        print("1 Tap")
    }
    
    let twoBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("2", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleTwo), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleTwo() {
        print("2 Tap")
    }
    
    let threeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("3", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleThree), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleThree() {
        print("3 Tap")
    }
    
    let plusBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handlePlus), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlePlus() {
        print("+ tap")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(oneBtn)
        oneBtn.layer.cornerRadius = 10
        addSubview(twoBtn)
        twoBtn.layer.cornerRadius = 10
        addSubview(threeBtn)
        threeBtn.layer.cornerRadius = 10
        addSubview(plusBtn)
        plusBtn.layer.cornerRadius = 10
        setupButtons()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [oneBtn, twoBtn, threeBtn, plusBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
