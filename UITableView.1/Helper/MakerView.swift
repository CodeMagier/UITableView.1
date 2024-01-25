//
//  MakerView.swift
//  UITableView.1
//
//  Created by 1 on 25/1/24.
//

import UIKit

class MakerView {
    
    func makeLabel(text: String = "",
                   textColor: UIColor = . black,
                   textSize: CGFloat = 14, textWeigt: UIFont.Weight = .light,
                   numberOfLines: Int = 0 ) -> UILabel {
        lazy var label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: textWeigt)
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    

    func makeButton(title: String = "",
                    tintColor: UIColor = .systemBlue,
                    backgroundColor: UIColor? = nil,
                    cornerRadius: CGFloat = 14) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func makeImage(backgroundColor: UIColor = .white,
                   named: String = "",
                   contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView{
        let image = UIImageView()
        image.backgroundColor = backgroundColor
        image.image = UIImage(named: named)
        image.contentMode = contentMode
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func makeStack(axis: NSLayoutConstraint.Axis = .horizontal, spacing: CGFloat = 8) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
