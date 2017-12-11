//
//  UserModel.swift
//  SamadeA-ToDoLists
//
//  Created by AbdulSamade on 10/30/17.
//  Copyright © 2017 AbdulSamade. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Common {
    static var shared = Common()
    private init() {}
    
    
    var user: User!
}
