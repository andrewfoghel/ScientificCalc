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

let resultsLabel: UILabel = {
    let lbl = UILabel()
    lbl.textAlignment = .right
    lbl.text = "0"
    lbl.textColor = customOffBlack
    lbl.backgroundColor = customGray
    lbl.font = UIFont.systemFont(ofSize: 40)
    lbl.adjustsFontSizeToFitWidth = true
    return lbl
}()

var initialNumber: Double?
var secondNumber: Double?
var operationFlag = false
var degreeFlag = true

class ViewController: UIViewController {


    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = customOffBlack
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var degRadControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Deg", "Rad"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleDegRadChange), for: .valueChanged)
        sc.tintColor = customGray
        sc.layer.borderColor = customGray.cgColor
        sc.layer.borderWidth = 1
        sc.layer.cornerRadius = 5
        return sc
    }()
    
    @objc fileprivate func handleDegRadChange() {
        if degRadControl.selectedSegmentIndex == 0 {
            print("Degrees")
            degreeFlag = true
        } else {
            print("Radians")
            degreeFlag = false
        }
    }
    
    fileprivate func setupViews() {
        view.backgroundColor = customGray
        view.addSubview(resultsLabel)
        view.addSubview(containerView)
        view.addSubview(degRadControl)
        resultsLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 46)

        degRadControl.anchor(top: nil, left: nil, right: nil, bottom: containerView.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 8, width: width/2, height: 30)
        degRadControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        containerView.anchor(top: resultsLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom:  view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        print(containerView.frame.height)
        
        setupRows()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        
    }

    fileprivate func setupRows() {
        let stackView = UIStackView(arrangedSubviews: [TrigView(), LogView(), ExponentView(), ConstantsView(), TopRowView(), SecondRow(), ThirdRow(), FourthRow(), LastRow()])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        containerView.addSubview(stackView)
        stackView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, bottom: degRadControl.topAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 8, width: 0, height: 0)
    }
    
    
}

