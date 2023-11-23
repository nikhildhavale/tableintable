//
//  TableViewHolderView.swift
//  TestTableView
//
//  Created by Nikhil Dhavale on 23/11/23.
//

import UIKit

class TableViewHolderView: UIView {
    let colorArray = [UIColor.systemRed,UIColor.systemBlue, UIColor.systemGreen, UIColor.systemYellow, UIColor.systemGray, UIColor.systemGray2, UIColor.secondaryLabel,UIColor.label,UIColor.opaqueSeparator];
    var tableView: UITableView?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        if self.tableView == nil
        {
            let tableView = UITableView(frame: .zero, style: .plain)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            self.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            tableView.delegate = self
            tableView.dataSource = self 
            tableView.rowHeight = UITableView.automaticDimension
            self.tableView = tableView
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override var intrinsicContentSize: CGSize{
        if let contentSize = tableView?.contentSize {
            return CGSize(width: UIScreen.main.bounds.width, height: contentSize.height)
        }
        return .zero
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
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 0...50)
    }
    
}
