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

//        view.addSubview(exampleBlueView)
//        exampleBlueView.addSubview(pushButton)
//        exampleBlueView.addSubview(presentButton)
//
        view.addSubview(welcomeImage)
        welcomeImage.superview?.addSubview(pushButton)
        welcomeImage.superview?.addSubview(presentButton)
    }

    private func configureLayout() {
        pushButton.snp.makeConstraints{
            $0.bottom.equalTo(presentButton.snp.top).offset(-10)
            $0.centerX.equalTo(presentButton.snp.centerX)
        }
        
        presentButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
        }

//        exampleBlueView.snp.makeConstraints{
//            $0.edges.equalToSuperview()
//        }

        welcomeImage.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(180)
            $0.width.equalToSuperview().multipliedBy(3.5)
            $0.height.equalToSuperview()
        }
    }

    // MARK: - Subviews

    private lazy var pushButton: UIButton = {
        $0.setTitle("Push Button", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pacifico", size: 25)
        $0.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())
    
    private lazy var presentButton: UIButton = {
        $0.setTitle("Present Button", for: .normal)
        $0.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        $0.backgroundColor = .blue.withAlphaComponent(0.5)
        $0.layer.cornerRadius = $0.frame.height / 2
        return $0
    }(UIButton())

    
    private lazy var exampleBlueView: UIView = {
        $0.backgroundColor = .red.withAlphaComponent(0.5)
        return $0
    }(UIView())
    
    private lazy var welcomeImage: UIImageView = {
        $0.image = UIImage(named: "welcome")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

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

