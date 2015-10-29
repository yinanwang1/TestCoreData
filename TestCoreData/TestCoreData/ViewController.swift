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
    
    var dataSourceTest = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataDic = fetchDataFromFile()
        
        let allDataArr = Department.MR_findAll()
        displayDataInTextView(allDataArr)
        
        self.dataSourceTest = dataDic
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Fetch Data From Core Data
    func fetchDataFromFile() -> NSDictionary {
        let companyPath = NSBundle.mainBundle().pathForResource("Company", ofType: "plist")
        let companyDataDic = NSMutableDictionary.init(contentsOfFile: companyPath!)
        
        
        return companyDataDic!
    }
    
    
    
    // MARK: - Display Data in TextView
    func displayDataInTextView(data:AnyObject) {
        
        var dataStr = "/********/\n"
        
        for object in data as! Array<Department> {
            dataStr += object.descriptionSimple()
        }
        
        self.displayTextView.text = dataStr.stringByRemovingPercentEncoding
    }
    
    // MARK: - Save to Core Data
    func saveData(data: NSDictionary) {
        
        MagicalRecord.saveWithBlockAndWait { (context:NSManagedObjectContext!) -> Void in
            
            Board.MR_importFromObject(data, inContext: context)
            
            print("Save to Core data has done.")
        }
        
        // display all data in core data
        let allDataArr = Department.MR_findAll()
        self.displayDataInTextView(allDataArr)
        
        let context:NSManagedObjectContext = NSManagedObjectContext.MR_rootSavingContext()
        context.MR_saveToPersistentStoreAndWait()
    }
    
    
    
    // MARK: - Target Methods
    
    @IBAction func onClickInsertBtn(sender: AnyObject) {
        
        self.saveData(self.dataSourceTest)
        
    }
    
    
}

