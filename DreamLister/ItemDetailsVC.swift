//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Burak Firik on 2/14/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

  @IBOutlet weak var storePicker: UIPickerView!
  @IBOutlet weak var titleView: CustomTextField!
  @IBOutlet weak var priceField: CustomTextField!
  @IBOutlet weak var detailsField: CustomTextField!
  var stores  = [Store]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
      if let topItem = self.navigationController?.navigationBar.topItem {
        topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
      }
      
      
      storePicker.delegate = self
      storePicker.dataSource = self
      /*
      let store = Store(context : context)
      store.name = "Best Buy"
      
      let store2 = Store(context : context)
      store2.name = "Tesla Dealership"
      
      let store3 = Store(context : context)
      store3.name = "Fries Electronics"
      
      let store4 = Store(context : context)
      store4.name = "Target"
      
      let store5 = Store(context : context)
      store5.name = "Amazon"
      
      let store6 = Store(context : context)
      store6.name = "K mart"
      
      ad.saveContext()
    */
      
      getStores()
      
        // Do any additional setup after loading the view.
    }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     let store = stores[row]
     return store.name
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return stores.count
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  func getStores() {
    let fetchRequest : NSFetchRequest<Store> = Store.fetchRequest()
    do {
      self.stores = try context.fetch(fetchRequest)
      self.storePicker.reloadAllComponents()
    } catch {
      // handls
    }
  }

  @IBAction func savePressed(_ sender: UIButton) {
    let item = Item(context: context)
    
    if let title = titleView.text {
      item.title = title
    }
    if let price = priceField.text {
      item.price = (price as NSString).doubleValue
    }
    if let details = detailsField.text {
      item.details = details
    }
    
    item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
    ad.saveContext()
    _ = navigationController?.popViewController(animated: true)
    
  }
}
