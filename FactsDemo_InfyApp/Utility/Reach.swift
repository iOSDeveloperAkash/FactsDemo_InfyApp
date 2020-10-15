//  Created by Akash on 09/14/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//


import Foundation
import SystemConfiguration


class Utility:NSObject {
    
    class func isInternetReachable() -> Bool {
        let reachability: Reachability? = Reachability()
        var isInternetAvailable: Bool = false
        if let reachability = reachability {
            if reachability.connection == .wifi {
                isInternetAvailable = true
                print("Utility :: Reachable via WiFi")
            } else if reachability.connection == .cellular {
                isInternetAvailable = true
                print("Utility :: Reachable via WAN")
            }
        } else {
            isInternetAvailable = false
        }
        return isInternetAvailable
    }
}
