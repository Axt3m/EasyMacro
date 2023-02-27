//
//  ViewController.swift
//  EasyMacro_v1
//
//  Created by Angela Terao on 20/02/2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViews()
        configureLayout()
      
    }
    
    private func configureViews() {
        view.backgroundColor = .white

        view.addSubview(welcomeImage)
        welcomeImage.superview?.addSubview(getStartedButton)
        welcomeImage.superview?.addSubview(welcomeTitle)
        welcomeImage.superview?.addSubview(welcomeText)
    }

    private func configureLayout() {
        getStartedButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
            $0.width.equalTo(180)
            $0.height.equalTo(45)
        }

        welcomeImage.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(180)
            $0.width.equalToSuperview().multipliedBy(3.5)
            $0.height.equalToSuperview()
        }
        
        welcomeTitle.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        welcomeText.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }

    // MARK: - Subviews

    private lazy var welcomeImage: UIImageView = {
        $0.image = UIImage(named: Constants.welcomeImageName)
        $0.alpha = 0.3
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var welcomeTitle: UILabel = {
        $0.text = Constants.welcomeTitle
        $0.font = UIFont(name: Constants.welcomeTitlePolice, size: 40)
        $0.textColor = .blue
        $0.textAlignment = .center
        $0.numberOfLines = 0
        
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var welcomeText: UILabel = {
        $0.text = Constants.welcomeText
        $0.font = UIFont(name: Constants.welcomeTextPolice, size: 18)
        $0.textColor = .blue
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var getStartedButton: UIButton = {
        $0.setTitle(Constants.welcomeButtonTitle, for: .normal)
        $0.titleLabel?.font = UIFont(name: Constants.welcomeButtonPolice, size: 21)
        $0.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 18
        return addShadow(to: $0)
    }(UIButton())
    
    private func addShadow(to button: UIButton) -> UIButton {
        button.layer.shadowRadius = 2
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        
        return button
    }

    // MARK: - Actions

    @objc private func pushAction() {
        let controller = FirstViewController()

        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func presentAction() {
        let controller = FirstViewController()
        present(controller, animated: true)
    }


}

