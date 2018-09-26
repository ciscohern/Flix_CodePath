//
//  Reachability.swift
//  Flix
//
//  Created by Francisco Hernanedez on 9/7/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
