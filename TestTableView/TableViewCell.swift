//
//  TableViewCell.swift
//  TestTableView
//
//  Created by Nikhil Dhavale on 23/11/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewContainerView: UIView!
    var tableHolderView:TableViewHolderView?
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update()
    {
        if tableHolderView == nil {
            let holderView = TableViewHolderView(frame: .zero)
            tableViewContainerView.addSubview(holderView)
            holderView.translatesAutoresizingMaskIntoConstraints = false
            holderView.topAnchor.constraint(equalTo: tableViewContainerView.topAnchor).isActive = true
            holderView.bottomAnchor.constraint(equalTo: tableViewContainerView.bottomAnchor).isActive = true
            holderView.leadingAnchor.constraint(equalTo: tableViewContainerView.leadingAnchor).isActive = true
            holderView.bottomAnchor.constraint(equalTo: tableViewContainerView.bottomAnchor).isActive = true

        }
        label.text = generateRandomString(length:Int.random(in: 30...1000))
        
    }
    func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
