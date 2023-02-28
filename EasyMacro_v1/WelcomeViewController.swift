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
        welcomeImage.superview?.addSubview(welcomeText1)
        welcomeImage.superview?.addSubview(welcomeText2)
    }

    private func configureLayout() {
        
//        stackView.snp.makeConstraints{
//            $0.center.equalToSuperview()
//        }
        
        getStartedButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(100)
            $0.width.equalTo(180)
            $0.height.equalTo(45)
        }

        welcomeImage.snp.makeConstraints{
//            $0.trailing.equalToSuperview().offset(180)
//            $0.width.equalToSuperview().multipliedBy(3.5)
//            $0.height.equalToSuperview()
            
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
        }
        
        welcomeTitle.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(250)
            $0.centerX.equalToSuperview()
        }
        
        welcomeText1.snp.makeConstraints{
            $0.top.equalTo(welcomeTitle.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        welcomeText2.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(getStartedButton.snp.top).offset(-25)
        }
    }

    // MARK: - Subviews
    
    private lazy var stackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.frame = view.bounds
        $0.backgroundColor = .systemYellow
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
        $0.font = UIFont(name: Constants.welcomeTitlePolice, size: 40)
        $0.textColor = UIColor(red: 72.0/255.0, green: 70.0/255.0, blue: 70.0/255.0, alpha: 1)
        $0.textAlignment = .center
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
        $0.textColor = .black.withAlphaComponent(0.9)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        return $0
    }(UILabel())
    
    private lazy var getStartedButton: UIButton = {
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
    
    //UIColor(red: CGFloat(238.0/255.0), green: CGFloat(69.0/255.0), blue: CGFloat(50.0/255.0), alpha: 1)
    //UIColor(red: CGFloat(239.0/255.0), green: CGFloat(106.0/255.0), blue: CGFloat(91.0/255.0), alpha: 1)

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

