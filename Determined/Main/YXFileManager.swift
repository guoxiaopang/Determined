//
//  YXFileManager.swift
//  Determined
//
//  Created by duoyi on 16/12/13.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit


class YXFileManager: NSObject
{
    static let share = YXFileManager();
    
    // 返回文件路径
    func HomeName(path : String, fileName : String?) -> String
    {
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last;
        let fileManager = FileManager.default;
        var newPath = cachePath! + path;
        if !fileManager.fileExists(atPath: cachePath!)
        {
            // 如果不存在目录
            do{
              try fileManager.createDirectory(atPath: newPath, withIntermediateDirectories: true, attributes: nil);
            } catch{
            
            }
          
        }
        // 拼接目录 + 文件名
        if fileName == nil
        {
            newPath = newPath +
        }
        else
        {
            newPath = newPath + fileName!;
        }
        return newPath;
    }
    
    func getRandomStringOfLength(length: Int) -> String
    {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let c = characters.characters;
        var ranStr = ""
        for _ in 0..<length
        {
            let index = Int(arc4random_uniform(UInt32(characters.characters.count)));
            ranStr.append(c[11]);
        }
        return ranStr
        
    }
}
