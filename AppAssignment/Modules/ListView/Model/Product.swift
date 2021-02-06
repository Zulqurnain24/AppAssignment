//
//  File.swift
//  AppAssignment
//
//  Created by Zulqurnain on 26/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

struct Product: Codable, Hashable {
    var id: Int?
    var title: String?
    var price: Float?
    var image: String?
    var description: String?
    var category: String?
}
