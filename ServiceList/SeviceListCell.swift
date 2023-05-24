//
//  SeviceListCell.swift
//  ServiceList
//
//  Created by Muhamad Talebi on 5/22/23.
//

import UIKit

class ServiceListCell: UICollectionViewCell {
    
    public var starButtonClosure: (() -> ())?
    
    // MARK: - Private Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Outfit-SemiBold", size: 14)
        label.text = "Design Mobile App"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Graphics & Design"
        label.font = UIFont(name: "Outfit-Regular", size: 14)
        label.textColor = .systemCyan.withAlphaComponent(0.9)
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var starButtonImageView: UIImageView = {
        let image = UIImage(named: "EllipsisH")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Do wireframe for web , website , and mobile app ui ux design Describe your top skills , strengths , and experiences..."
        label.font = UIFont(name: "Outfit-Regular", size: 12)
        label.textColor = .black.withAlphaComponent(0.6)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var packagesImageView: UIImageView = {
        let image = UIImage(named: "Package")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var numberOfPackages: UILabel = {
        let label = UILabel()
        label.text = "3 packages"
        label.font = UIFont(name: "Outfit-Regular", size: 12)
        label.textColor = .black.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var packageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: - Add Subviews
        addSubview(containerView)
        
        containerView.addSubview(mainStackView)
        starButton.addSubview(starButtonImageView)
        
        detailStackView.addArrangedSubview(detailsLabel)
        detailStackView.addArrangedSubview(starButton)
        
        packageStackView.addArrangedSubview(packagesImageView)
        packageStackView.addArrangedSubview(numberOfPackages)
        
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(detailStackView)
        mainStackView.addArrangedSubview(descriptionLabel)
        mainStackView.addArrangedSubview(packageStackView)
        
        // MARK: - Setup Constraints
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]
        
        let mainConstraints = [
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ]
        
        let starButtonSizeConstraints = [
            starButton.heightAnchor.constraint(equalToConstant: 24),
            starButton.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        let starImageConstraints = [
            starButtonImageView.topAnchor.constraint(equalTo: starButton.topAnchor, constant: 2),
            starButtonImageView.trailingAnchor.constraint(equalTo: starButton.trailingAnchor, constant: -2),
            starButtonImageView.bottomAnchor.constraint(equalTo: starButton.bottomAnchor, constant: -2),
            starButtonImageView.leadingAnchor.constraint(equalTo: starButton.leadingAnchor, constant: 2),
        ]
        
        let packagesImageSizeConstraints = [
            packagesImageView.heightAnchor.constraint(equalToConstant: 16),
            packagesImageView.widthAnchor.constraint(equalToConstant: 16)
        ]
        
        NSLayoutConstraint.activate(containerViewConstraints)
        NSLayoutConstraint.activate(mainConstraints)
        NSLayoutConstraint.activate(starButtonSizeConstraints)
        NSLayoutConstraint.activate(starImageConstraints)
        NSLayoutConstraint.activate(packagesImageSizeConstraints)
            
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var reuseIdentifier: String {
        return String.init(describing: self.self)
    }
    
    @objc private func starButtonTapped() {
        starButtonClosure?()
    }
}
