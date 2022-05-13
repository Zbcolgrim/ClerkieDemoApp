//
//  TextWithImageComponent.swift
//  BackendForFrontend
//
//  Created by Zachary Buffington on 5/10/22.
//

import UIKit

class TextWithImageComponent: UIView {
    private let margin: CGFloat = 15
    
    func setUp(with data: TextWithImageData) {
        // make the imageview
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let data = try? Data(contentsOf: data.image.src) {
            imageView.image = UIImage(data: data)
        }
        
        // make the title label
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = data.title.text
        titleLabel.font = UIFont.systemFont(ofSize: data.title.fontSize)
        titleLabel.numberOfLines = 1
        
        // make the subtitle label
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = data.subtitle.text
        subtitleLabel.font = UIFont.systemFont(ofSize: data.subtitle.fontSize)
        subtitleLabel.numberOfLines = 1
        
        // add subviews
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        // add constraints
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: margin),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: margin),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: margin),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
            subtitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // calculate and apply height constraint to imageview
        let height = data.height ?? (titleLabel.frame.height + 5 + subtitleLabel.frame.height)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: height)
        ])
        imageView.layer.cornerRadius = height / 2
        imageView.clipsToBounds = true
    }
}
