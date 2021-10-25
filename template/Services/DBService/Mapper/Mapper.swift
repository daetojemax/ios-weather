import Foundation

class Mapper<T, Y>
{
    
    func mapTo(item: Y) -> T? {
        return nil
    }
    
    func mapFrom(item: T) -> Y? {
        return nil
    }
    
    func mapTo(item: Y?) -> T? {
        guard let item = item else { return nil }
        return mapTo(item: item)
    }
    
    func mapFrom(item: T?) -> Y? {
        guard let item = item else { return nil }
        return mapFrom(item: item)
    }
    
    func map(from json: AnyObject?) -> T? {
        return nil
    }
    
}
