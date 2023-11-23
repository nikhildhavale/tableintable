//
//  TestViewController.swift
//  TestTableView
//
//  Created by Nikhil Dhavale on 23/11/23.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let holderView = TableViewHolderView(frame: .zero)
        self.view.addSubview(holderView)
        holderView.translatesAutoresizingMaskIntoConstraints = false
        holderView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        holderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        holderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        holderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
