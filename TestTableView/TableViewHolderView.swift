//
//  TableViewHolderView.swift
//  TestTableView
//
//  Created by Nikhil Dhavale on 23/11/23.
//

import UIKit

class TableViewHolderView: UITableView {
    let colorArray = [UIColor.systemRed,UIColor.systemBlue, UIColor.systemGreen, UIColor.systemYellow, UIColor.systemGray, UIColor.systemGray2, UIColor.secondaryLabel,UIColor.label,UIColor.opaqueSeparator];
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override var contentSize: CGSize{
            didSet {
                if oldValue.height != self.contentSize.height {
                    invalidateIntrinsicContentSize()
                }
            }
        }

    init()
    {
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override var intrinsicContentSize: CGSize{
        layoutIfNeeded()
        return CGSize(width: UIScreen.main.bounds.width, height: contentSize.height)
    }
}
extension TableViewHolderView:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = tableViewCell.defaultContentConfiguration()
        let count = colorArray.count - 1
        config.image =  UIImage(systemName: "smallcircle.filled.circle.fill")?.withTintColor(colorArray[Int.random(in: 0...count)],renderingMode: .alwaysOriginal)
        config.text = "Text \(indexPath.row)"
        tableViewCell.contentConfiguration = config
        tableViewCell.layoutIfNeeded()
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 0...50)
    }
    
}
