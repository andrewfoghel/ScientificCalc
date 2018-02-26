//
//  ViewController.swift
//  ScientificCalc
//
//  Created by Andrew Foghel on 2/26/18.
//  Copyright © 2018 andrewfoghel. All rights reserved.
//

import UIKit

let customGray = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
let customOffBlack = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1)
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height


class ViewController: UIViewController {

    let resultsLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "90123"
        lbl.textColor = customOffBlack
        lbl.backgroundColor = customGray
        lbl.font = UIFont.systemFont(ofSize: 40)
        return lbl
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = customOffBlack
        view.isUserInteractionEnabled = true
        return view
    }()
    
    fileprivate func setupViews() {
        view.backgroundColor = customGray
        view.addSubview(resultsLabel)
        view.addSubview(containerView)
        
        resultsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 46)

        
        containerView.anchor(top: resultsLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        print(containerView.frame.height)
        
        setupRows()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        
    }

    fileprivate func setupRows() {
        let stackView = UIStackView(arrangedSubviews: [TrigView(), LogView(), ExponentView(), ConstantsView(), TopRowView(), SecondRow(), ThirdRow(), FourthRow()])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        containerView.addSubview(stackView)
        stackView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, bottom: containerView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 8, width: 0, height: 0)
    }
    
    
}

