
import Foundation
import UIKit
 
class Autorisation {
   /* static var shared = Autorisation()
    var login: Bool = true
    private init() {}
    */
    
    static var shared: Autorisation = {
        let login = Autorisation()
    return login
    }()
    private init(){
        
    }
    
}
