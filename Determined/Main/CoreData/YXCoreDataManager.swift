//
//  YXCoreDataManager.swift
//  Determined
//
//  Created by duoyi on 16/12/2.
//  Copyright © 2016年 duoyi. All rights reserved.
//

import UIKit
import CoreData

class YXCoreDataManager: NSObject
{
    
    // swift 单例
    private static let instance : YXCoreDataManager = YXCoreDataManager();
    class func shareManager()-> YXCoreDataManager
    {
        return instance;
    }
    
    var managedObjectContext: NSManagedObjectContext?;
    override init()
    {
        super.init();
        let modelURL = Bundle.main.url(forResource: "data", withExtension: "momd");
        if modelURL != nil
        {
            let mon  = NSManagedObjectModel(contentsOf: modelURL!);
            let psc = NSPersistentStoreCoordinator.init(managedObjectModel: mon!);
            managedObjectContext = NSManagedObjectContext.init(concurrencyType: .mainQueueConcurrencyType);
            managedObjectContext?.persistentStoreCoordinator = psc;
            
            DispatchQueue.global(qos: .background).sync {
                let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                let docURL = urls[urls.endIndex-1]
                let storeURL = docURL.appendingPathComponent("PersonData.sqlite");
                do
                {
                    try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                } catch
                {
                    fatalError("Error migrating store: \(error)")
                }
            }
            
        }
        else
        {
            print("读取数据库文件失败");
        }
    }
    
    func insert(_ uuid : String,_ dict : NSDictionary)
    {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "PersonData", into: managedObjectContext!) as! PersonData;
        employee.uuid = uuid;
        employee.data = dict;
        self.save();
    }
    
    func save()
    {
        do
        {
            try managedObjectContext?.save();
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    func selected() -> NSArray
    {
        let moc = managedObjectContext
        let employeesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonData")
        
        do
        {
            let fetchedEmployees = try moc?.fetch(employeesFetch) as! [PersonData]
            return fetchedEmployees as NSArray;
        }
        catch
        {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    func deleteData( personData : PersonData)
    {
        // 先查询 存在再删除
        let entity = NSEntityDescription.entity(forEntityName: "PersonData", in: managedObjectContext!);
        let fetch = NSFetchRequest<NSFetchRequestResult>();
        fetch.entity = entity;
        fetch.predicate = NSPredicate.init(format: "uuid = %@", personData.uuid!);
        
        do
        {
            let fetchObject = try managedObjectContext?.fetch(fetch);
            if (fetchObject?.count)! > 0
            {
                managedObjectContext?.delete(personData);
                self.save();
                print("删除成功\(personData.uuid)");
            }
            else
            {
                print("删除的数据不存在");
            }
        }
        catch _ as NSError
        {
            fatalError("删除时候查询失败");
        }
        catch
        {
            print("未知错误");
        }
    }

}

