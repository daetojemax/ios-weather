import Foundation
import RealmSwift

class RealmServiceImpl: DBService
{
    typealias SortDescriptor = RealmSwift.SortDescriptor
    
    // MARK: - property
    
    fileprivate var realm: Realm!
    
    // MARK: - initial
    
    init()
    {
        self.realm = try! Realm()
    }
    
    // MARK: - RealmService

    func read<T: Object>(_ filter: String?,
                         orderBy: [String: Bool]?) -> [T]
    {
        var objects = realm.objects(T.self)
        if let filter = filter {
            objects = objects.filter(filter)
        }
        if let orderBy = orderBy {
            var descriptors = [SortDescriptor]()
            for (field, asc) in orderBy {
                let descriptor = SortDescriptor(keyPath: field, ascending: asc)
                descriptors.append(descriptor)
            }
            objects = objects.sorted(by: descriptors)
        }
        var ts = [T]()
        for t in objects {
            ts.append(t)
        }
        return ts
    }
    
    func write(_ objects: [Object]?,
        needUpdate: Bool,
        successHandler: () -> Void)
    {
        guard let objects = objects else { return }
        do {
            realm.beginWrite()
            for object in objects {
                realm.add(object, update: .modified)
            }
            try realm.commitWrite()
        } catch { }
        successHandler()
    }
    
    func deleteAll(_ successHandler: () -> Void) {
        do {
            realm.beginWrite()
            realm.deleteAll()
            try realm.commitWrite()
        } catch { }
        successHandler()
    }
    
    func truncateModel<T: Object>(_ type: T.Type, byFilter: String?, complition: (() -> Void)?) {
        let objects = read(byFilter, orderBy: nil) as [T]
        do {
            realm.beginWrite()
            realm.delete(objects)
            try realm.commitWrite()
            complition?()
        } catch {
            complition?()
        }
    }

}
