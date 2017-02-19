//
//  ViewController.swift
//  SubStringWithRange
//
//  Created by zhi zhou on 2016/11/1.
//  Copyright © 2016年 zhi zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "<a href= http://weibo.com rel= nofollow>新浪微博</a>"
        
        let range = string.range(of: ">")
        let startIndex = range!.upperBound
        
        let range1 = Range(uncheckedBounds: (lower: string.startIndex, upper: string.endIndex))
        let endRange = string.range(of: "<", options: .backwards, range: range1, locale: Locale(identifier: "<"))
        let endIndex = endRange!.lowerBound
        
        let searchRange = Range(uncheckedBounds: (startIndex, endIndex))
        
        let endString = string.substring(with: searchRange)
        print(endString)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// 搜寻需要的字符索引
    func search(needString: Character, inString: String) -> [Int] {
        var index = 0
        var needIndex = [Int]()
        
        for value in inString.characters {
            if value == needString {
                needIndex.append(index)
            }
            index += 1
        }
        
        return needIndex
    }

}

