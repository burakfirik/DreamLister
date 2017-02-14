//
//  ItemCell.swift
//  DreamLister
//
//  Created by Burak Firik on 2/13/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
  @IBOutlet weak var thump: UIImageView!

  @IBOutlet weak var title: UILabel!
  
  @IBOutlet weak var details: UILabel!
  @IBOutlet weak var price: UILabel!
  
  
  func configureCell(item: Item) {
    title.text = item.title
    price.text = "$\(item.price)"
    details.text = item.details
  }
  

}
