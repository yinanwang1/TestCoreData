//
//  ViewController.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/21.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//

import UIKit

import MagicalRecord


class ViewController: UIViewController {

    // MARK: -
    // MARK: Property
    
    @IBOutlet weak var displayTextView: UITextView!
    
    var dataSourceTest: [AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataArr = fetchDataFromCoreData()
        
        let allDataArr = Department.MR_findAll()
        displayDataInTextView(allDataArr)
        
        self.dataSourceTest = dataArr as [AnyObject]!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Fetch Data From Core Data
    func fetchDataFromCoreData() -> NSArray {
        let companyPath = NSBundle.mainBundle().pathForResource("Company", ofType: "plist")
        let companyDataArr = NSMutableArray.init(contentsOfFile: companyPath!)
        
        return companyDataArr!
    }
    
    
    
    // MARK: - Display Data in TextView
    func displayDataInTextView(data:AnyObject) {
        let dataStr = data.description
        
        self.displayTextView.text = dataStr.stringByRemovingPercentEncoding
    }
    
    // MARK: - Save to Core Data
    func saveData(data: [AnyObject]) {
        
        MagicalRecord.saveWithBlockAndWait { (context:NSManagedObjectContext!) -> Void in
            
            for object in data {
                let departmentEntity = Department.MR_createEntityInContext(context)
                let dic = object as! Dictionary<String, AnyObject>
                departmentEntity.name = dic["name"] as? String
                departmentEntity.number = dic["number"] as? NSNumber
            }
            
            print("Save to Core data has done.")
        }
        
        // display all data in core data
        let allDataArr = Department.MR_findAll()
        self.displayDataInTextView(allDataArr)
    }
    
    
    
    // MARK: - Target Methods
    
    @IBAction func onClickInsertBtn(sender: AnyObject) {
        
        self.saveData(self.dataSourceTest)
        
    }
    
    
}

