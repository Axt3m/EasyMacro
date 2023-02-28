//
//  PushedViewController.swift
//  EasyMacro_v1
//
//  Created by Angela Terao on 22/02/2023.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureViews()
        configureLayout()
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
    }
    
    private func configureLayout() {
        stackView.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Subviews
    
    private lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 8
        $0.backgroundColor = .systemYellow
        $0.distribution = .fillEqually
        
        return $0
    }(UIStackView())
    
    private lazy var label1: UILabel = {
        //$0.font = .systemFont(ofSize: 16)
        $0.textColor = .blue
        $0.text = "Coucou"
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pacifico", size: 16)
        return $0
    }(UILabel())
    
    private lazy var label2: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .red
        $0.text = "Loul"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var label3: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .yellow
        $0.text = "Ava?"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    



}

