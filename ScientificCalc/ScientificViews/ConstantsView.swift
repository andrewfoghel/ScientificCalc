//
//  ConstantsView.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

class ConstantsView: UIView {
    
    let leftParBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("(", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleLeftPar), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleLeftPar() {
        resultsLabel.appendNumberText(numberStr: "(")
    }
    
    let rightParBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle(")", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleRightPar), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleRightPar() {
        resultsLabel.appendNumberText(numberStr: ")")
    }
    
    let squareBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("x^2", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handleSquare), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSquare() {
        guard let text = resultsLabel.text else { return }
        let num = Double(text)!
        initialNumber = pow(num, 2)
        
        if floor(initialNumber!) == initialNumber! {
            resultsLabel.text = "\(Int(initialNumber!))"
        } else {
            resultsLabel.text = "\(initialNumber!)"
        }
    }
    
    let piBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = customGray
        btn.setTitle("π", for: .normal)
        btn.setTitleColor(customOffBlack, for: .normal)
        btn.addTarget(self, action: #selector(handlePi), for: .touchUpInside)
        return btn
    }()
    
    @objc func handlePi() {
        resultsLabel.appendNumberText(numberStr: "\(Double.pi)")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(leftParBtn)
        leftParBtn.layer.cornerRadius = 10
        addSubview(rightParBtn)
        rightParBtn.layer.cornerRadius = 10
        addSubview(squareBtn)
        squareBtn.layer.cornerRadius = 10
        addSubview(piBtn)
        piBtn.layer.cornerRadius = 10
        setupButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupButtons() {
        let stackView = UIStackView(arrangedSubviews: [leftParBtn, rightParBtn, squareBtn, piBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10, paddingBottom: 0, width: 0, height: 0)
    }
}
