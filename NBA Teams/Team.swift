//
//  Team.swift
//  NBA Teams
//
//  Created by Wismin Effendi on 5/31/17.
//  Copyright © 2017 iShinobi. All rights reserved.
//

import Foundation

struct Team {
    
    enum Conference {
        case eastern
        case western
    }
    
    let name: String
    let location: String
    let conference: Conference
}
