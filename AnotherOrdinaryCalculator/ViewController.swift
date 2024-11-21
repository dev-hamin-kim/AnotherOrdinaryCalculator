//
//  ViewController.swift
//  AnotherOrdinaryCalculator
//
//  Created by 김하민 on 11/18/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let buttonLayout = [
        "7", "8", "9", "+"
//        "4", "5", "6", "-",
//        "1", "2", "3", "*",
//        "AC", "0", "=", "/",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        let buttonStacks = makeHorizontalButtonStack(with: buttonLayout)
        
        numberLabel()
        view.addSubview(buttonStacks)
        
        buttonStacks.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }

    }
    
    private func numberLabel() {
        view.backgroundColor = .black
        
        label.text = "12345"
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.textAlignment = .right
        
        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(100)
        }
        
    }
    
    private func makeHorizontalButtonStack(with buttonLayout: [String]) -> UIStackView {
        let buttonStack = UIStackView()
        
        buttonLayout.forEach {
            let button = Button(title: $0)
            
            button.snp.makeConstraints {
                $0.width.height.equalTo(80)
            }
            
            buttonStack.addArrangedSubview(button)
        }
        
        buttonStack.axis = .horizontal
        buttonStack.backgroundColor = .black
        buttonStack.spacing = 10
        buttonStack.distribution = .fillEqually
        
        return buttonStack
    }

}

#Preview {
    ViewController()
}
