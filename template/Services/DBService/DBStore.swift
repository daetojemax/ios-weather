import Foundation
import RealmSwift

class DBStore: BaseDBService {}
    
extension DBStore {
    
    func get<T, Y: Object>(_ mapper: Mapper<T, Y>) -> [T]? {
        return get(mapper, filter: nil)
    }
    
    func get<T, Y: Object>(_ mapper: Mapper<T, Y>,
             filter: String?) -> [T]?
    {
        return get(mapper, filter: filter, orderBy: nil) as [T]?
    }
    
    func get<T, Y: Object>(_ mapper: Mapper<T, Y>,
             filter: String?,
             orderBy: [String: Bool]?) -> [T]? {
        guard let dbItems = dbService.read(filter, orderBy: orderBy) as [Y]? else {
            return nil
        }
        var items = [T]()
        for item in dbItems {
            guard let t = mapper.mapTo(item: item) else { continue }
            items.append(t)
        }
        return items
    }
    
}

extension DBStore {
    
    func set<T, Y: Object>(_ mapper: Mapper<T, Y>,
             data: [T]?,
             complitationHandler: @escaping () -> Void)
    {
        guard let items = data else {
            complitationHandler()
            return
        }
        var os = [Y]()
        for item in items
        {
            guard let t = mapper.mapFrom(item: item) else { continue }
            os.append(t)
        }
        dbService.write(os,
                        needUpdate: true)
            {
                complitationHandler()
            }
    }
}

extension DBStore {
    
    func delete<Y: Object>(_ type: Y.Type, byFilter: String?, complition: (() -> Void)?) {
        dbService.truncateModel(type,
                                byFilter: byFilter,
                                complition: complition)
    }
}
