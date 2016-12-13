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
    
    // 返回文件路径 path文件夹名
    func homeName(path : String, fileName : String?) -> String
    {
        let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last;
        let fileManager = FileManager.default;
        var newPath = cachePath! + path;
        if fileManager.fileExists(atPath: cachePath!)
        {
            // 如果不存在目录
            do{
              try fileManager.createDirectory(atPath: newPath, withIntermediateDirectories: true, attributes: nil);
            } catch{
                print("目录创建失败")
            }
          
        }
        // 拼接目录 + 文件名
        if fileName == nil
        {
            newPath = newPath + "/" + self.randomString(length: 20);
        }
        else
        {
            newPath = newPath + fileName!;
        }
        return newPath;
    }
    
    // 返回随机字符串
    func randomString(length:Int) -> String
    {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var c = charSet.characters.map { String($0) }
        var s:String = ""
        for _ in (1...length)
        {
            let temp = Int(arc4random())%(c.count);
            s.append(c[temp])
        }
        return s
    }
    
    // 保存图片
    func saveImage(image : UIImage?, name : String?) -> String
    {
        if image == nil
        {
            return "";
        }
        let path = self.homeName(path: "/image", fileName: name);
        let data : Data = UIImageJPEGRepresentation(image!, 1)!;
        do
        {
            try  data.write(to: NSURL.fileURL(withPath: path));
        } catch
        {
            print("保存失败");
        }
        return path;
    }
}
