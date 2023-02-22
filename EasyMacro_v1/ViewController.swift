//
//  ViewController.swift
//  EasyMacro_v1
//
//  Created by Angela Terao on 20/02/2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureViews()
        configureLayout()
    }
    
    private func configureViews() {
        view.backgroundColor = .white

        view.addSubview(exampleBlueView)
        exampleBlueView.addSubview(pushButton)
        exampleBlueView.addSubview(presentButton)
    }

    private func configureLayout() {
        pushButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        presentButton.snp.makeConstraints{
            $0.top.equalTo(pushButton.snp.bottom).offset(8)
            $0.centerX.equalTo(pushButton.snp.centerX)
        }

        exampleBlueView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Subviews

    private lazy var pushButton: UIButton = {
        $0.setTitle("Push Button", for: .normal)
        $0.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var presentButton: UIButton = {
        $0.setTitle("Present Button", for: .normal)
        $0.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        return $0
    }(UIButton())


    private lazy var exampleBlueView: UIView = {
        $0.backgroundColor = .red.withAlphaComponent(0.5)
        return $0
    }(UIView())

    // MARK: - Actions

    @objc private func pushAction() {
        let controller = PushedViewController()

        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func presentAction() {
        let controller = PushedViewController()
        present(controller, animated: true)
    }


}

