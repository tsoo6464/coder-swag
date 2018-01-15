//
//  ViewController.swift
//  coder-swag
//
//  Created by Nan on 2018/1/10.
//  Copyright © 2018年 nan. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //指定tableView的資料來源跟delegate是來自這裡
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    //tableViewCell 總共有幾個row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //使用dequeueReusableCell讓cell是固定幾格然後會不斷更換資料
        //有滾動時才會載入更換資料 較不佔資源 也較順
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            //從dataService抓取資料後使用cell自訂的func來更新cell內的資料
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    //實現選擇到哪了個cell要做什麼事
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        //使用ProductVC這個Segue傳送選擇到的category資料過去
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    //sender是上面的performSegue的sender
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            //在開發模式會檢查是否有錯誤 發佈版本不會執行 true就執行下列
            assert(sender as? Category != nil)
            productsVC.initProducts(category: sender as! Category)
        }
    }


}

