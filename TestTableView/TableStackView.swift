//
//  TableStackView.swift
//  TestTableView
//
//  Created by Nikhil Dhavale on 23/11/23.
//

import UIKit

class TableStackView: UIView {

    let stackView = UIStackView()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init()
    {
        super.init(frame: .zero)
        stackView.axis = .vertical
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
    }
    func updateUI()
    {
        let count = Int.random(in: 0...50)
        stackView.arrangedSubviews.forEach{$0.isHidden = true}
        for i in 0...count
        {
            if i < stackView.arrangedSubviews.count {
                if let arrangedSubView = stackView.arrangedSubviews[i] as? ImageTextView
                {
                    arrangedSubView.updateUI()
                    arrangedSubView.isHidden = false
                }
            }
            else {
                let imageTextView = ImageTextView()
                imageTextView.updateUI()
                stackView.addArrangedSubview(imageTextView)
            }
            
        }
        
    }
}

class ImageTextView:UIView
{
    let horizontalStackView = UIStackView()
    let colorArray = [UIColor.systemRed,UIColor.systemBlue, UIColor.systemGreen, UIColor.systemYellow, UIColor.systemGray, UIColor.systemGray2, UIColor.secondaryLabel,UIColor.label,UIColor.opaqueSeparator];
    let imageview = UIImageView()
    let label = UILabel()
    
    init()
    {
        super.init(frame: .zero)
        self.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor).isActive = true
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .equalCentering
        label.numberOfLines = 0
        horizontalStackView.addArrangedSubview(imageview)
        horizontalStackView.addArrangedSubview(label)
    }
    func updateUI()
    {
        let count = colorArray.count - 1
        imageview.image =  UIImage(systemName: "smallcircle.filled.circle.fill")?.withTintColor(colorArray[Int.random(in: 0...count)],renderingMode: .alwaysOriginal)
        label.text = String.generateRandomString(length:Int.random(in: 30...1000))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
