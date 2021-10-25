import Foundation

class BaseDBService
{
    
    // MARK: - property
    
    var dbService: DBService!
    
    // MARK: - initial
    
    convenience init(dbService: DBService)
    {
        self.init()
        self.dbService = dbService
    }
    
}
