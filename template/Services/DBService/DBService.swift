import Foundation
import RealmSwift

protocol DBService: AnyObject {
    
    func read<T: Object>(_ filter: String?,
                         orderBy: [String: Bool]?) -> [T]

    func write(_ objects: [Object]?,
               needUpdate: Bool,
               successHandler: () -> Void)

    func truncateModel<T: Object>(_ type: T.Type, byFilter: String?, complition: (() -> Void)?)
    
}
