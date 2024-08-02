import CoreData
import Foundation

class CoreDataViewModel {
    let persistentContainer: NSPersistentContainer
    var data: [DataEntity] = []
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR Loading Core Data, \(error)")
            } else {
                print("SUCCESS Loading Core Data")
            }
        }
    }
    
    func fetchData() -> DataEntity? {
        let request = NSFetchRequest<DataEntity>(entityName: "DataEntity")
        do {
            data = try persistentContainer.viewContext.fetch(request)
            print("Data in CoreData = \(data)")
        } catch {
            print("ERROR Fetching Core Data")
        }
        return data.first
    }
    
    func saveData() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let enerror = error as NSError
                fatalError("\(enerror.userInfo)")
            }
        }
    }
    
    func addData(number: Int16, text: String) {
        let entity = NSEntityDescription.entity(forEntityName: "DataEntity", in: self.persistentContainer.viewContext)
        let data = NSManagedObject(entity: entity!, insertInto: self.persistentContainer.viewContext)
        data.setValue(number, forKey: "number")
        data.setValue(text, forKey: "text")
        
        saveData()
    }
    
    func updateData(number: Int16, text: String) {
        let fetchData = fetchData()
        fetchData?.number = number
        fetchData?.text = text
        
        saveData()
    }
    
    func deleteData() {
        let context = persistentContainer.viewContext
        
        guard let fetchData = fetchData() else {
            return
        }
        
        context.delete(fetchData)
        saveData()
    }
}
