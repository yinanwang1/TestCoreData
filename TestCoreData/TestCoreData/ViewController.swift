//
//  ViewController.swift
//  TestCoreData
//
//  Created by ArthurWang on 15/10/21.
//  Copyright © 2015年 ArthurWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -
    // MARK: Property
    
    @IBOutlet weak var displayTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataDic = fetchDataFromCoreData()
        
        displayDataInTextView(dataDic)
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
    func saveData(data: AnyObject) {
        
    }
    
}

