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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        
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

}

#Preview {
    ViewController()
}
