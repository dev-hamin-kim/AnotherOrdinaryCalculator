//
//  ButtonModel.swift
//  AnotherOrdinaryCalculator
//
//  Created by 김하민 on 11/19/24.
//

import UIKit

enum ButtonRole {
    case number, operation, modifier, undefined
}

class Button: UIButton {
    var title: String
    
    var buttonRole: ButtonRole {
        if self.title.isNumber {
            return .number
        }
        
        switch self.title {
        case "+", "-", "*", "/": return .operation
        case "AC", "+/-", "%": return .modifier
        default: return .undefined
        }
    }
    
    var color: UIColor {
        switch self.buttonRole {
        case .number: UIColor(red: 58/255,
                           green: 58/255,
                           blue: 58/255,
                           alpha: 1.0)
        case .operation: UIColor.systemOrange
        case .modifier: UIColor.systemGray
        case .undefined: UIColor.systemRed
        }
        
    }

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        
        setButton()
    }
    
    func setButton() {
        setTitle(self.title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 30)
        backgroundColor = color
        frame.size = CGSize(width: 80, height: 80)
        
        let action = #selector(onTap)
        addTarget(self, action: action, for: .touchDown)
    }
    
    @objc func onTap(_ sender: UIButton) {
        let title = sender.titleLabel?.text
        
        print("\(title ?? "error") tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension String {
    var isNumber: Bool {
        CharacterSet(charactersIn: self).isSubset(of: .decimalDigits)
    }
    
}
