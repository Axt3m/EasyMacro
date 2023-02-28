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
        welcomeImage.superview?.addSubview(stackView)
        stackView.addArrangedSubview(welcomeTitle)
        stackView.addArrangedSubview(welcomeText1)
        stackView.addArrangedSubview(welcomeText2)
        stackView.addArrangedSubview(startButton)

    }

    private func configureLayout() {
        
        stackView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview().inset(4)
        }
        
        startButton.snp.makeConstraints{
            $0.width.equalToSuperview().inset(120)
            $0.height.equalTo(45)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }

        welcomeImage.snp.makeConstraints{
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.height.equalToSuperview().multipliedBy(0.35)
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(70)
        }
        
        welcomeTitle.snp.makeConstraints{
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.bottom.equalTo(welcomeText1.snp.top).offset(470)
        }
        
        welcomeText1.snp.makeConstraints{
            $0.bottom.equalTo(welcomeText2.snp.top).offset(-80)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)

        }

        welcomeText2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(70)
            $0.bottom.equalTo(startButton.snp.top).offset(-20)
        }
    }

    // MARK: - Subviews
    
    private lazy var stackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 8
        $0.frame = view.bounds
        $0.distribution = .fill
        return $0
    }(UIStackView())

    private lazy var welcomeImage: UIImageView = {
        $0.image = UIImage(named: Constants.welcomeImageName)
        $0.alpha = 0.9
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var welcomeTitle: UILabel = {
        $0.text = Constants.welcomeTitle
        $0.font = UIFont(name: Constants.welcomeTitlePolice, size: 35)
        $0.textColor = UIColor(red: 72.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1)
        $0.textAlignment = .left
        $0.numberOfLines = 0
        
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var welcomeText1: UILabel = {
        $0.text = Constants.welcomeText1
        $0.font = UIFont(name: Constants.welcomeTextPolice1, size: 18)
        $0.textColor = .black.withAlphaComponent(0.9)
        $0.textAlignment = .justified
        $0.numberOfLines = 0
        //$0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var welcomeText2: UILabel = {
        $0.text = Constants.welcomeText2
        $0.font = UIFont(name: Constants.welcomeTextPolice2, size: 15)
        $0.textColor = .black.withAlphaComponent(0.7)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var startButton: UIButton = {
        $0.setTitle(Constants.welcomeButtonTitle, for: .normal)
        $0.titleLabel?.font = UIFont(name: Constants.welcomeButtonPolice, size: 21)
        $0.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        $0.backgroundColor = UIColor(red: 67.0/255.0, green: 211.0/255.0, blue: 175.0/255.0, alpha: 1).withAlphaComponent(0.9)
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

