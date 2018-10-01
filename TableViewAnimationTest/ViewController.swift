//
//  ViewController.swift
//  TableViewAnimationTest
//
//  Created by 廖冠翰 on 2018/10/1.
//  Copyright © 2018年 廖冠翰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var datas: [[String]] = [["0","1","2"],["0","1"],["0","1","2"],["0","1","2","3","4","5"],["0","1","2"]]
    
    private var tempDicts = [Int : [String]]()

}

//MARK: - Life Cycle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HenryCell") as! HenryCell
        cell.title = datas[indexPath.section][indexPath.row]
        return cell
        
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = HenryHeaderView.headerView()
        headerView.delegate = self
        headerView.index = section

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        datas[indexPath.section].remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
}

//MARK: - HenryHeaderViewDelegate
extension ViewController: HenryHeaderViewDelegate {
    
    func henryHeaderView(_ headerView: HenryHeaderView, didSelectAt index: Int) {
        
        if let data = tempDicts[index]  { //開啟section
            datas[index] = data
            tempDicts.removeValue(forKey: index)
            
            var indexPathArray: [IndexPath] = []
            for (rowIndex , _) in datas[index].enumerated() {
                indexPathArray.append(IndexPath(row: rowIndex, section: index))
            }
            
            tableView.beginUpdates()
            tableView.insertRows(at: indexPathArray, with: .automatic)
            tableView.endUpdates()
            
        }else { //關閉section
            tempDicts[index] = datas[index]
            datas[index].removeAll()
            
            var indexPathArray: [IndexPath] = []
            for (rowIndex , _) in tempDicts[index]!.enumerated() {
                indexPathArray.append(IndexPath(row: rowIndex, section: index))
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: indexPathArray, with: .automatic)
            tableView.endUpdates()
        }
        
    }
}
