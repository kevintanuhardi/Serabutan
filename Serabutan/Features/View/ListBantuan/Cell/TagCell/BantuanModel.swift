//
//  BantuanModel.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 26/07/21.
//

import Foundation

class BantuanModel{
    var urgency: Urgency?
    var title: String?
    var price: Int?
    var tags: [String]?
    var distance: Int?
    var status: Status?
    
    init(urgency: Urgency, title: String, price: Int, tags: [String], distance: Int, status: Status) {
        self.urgency = urgency
        self.title = title
        self.price = price
        self.tags = tags
        self.distance = distance
        self.status = status
    }
}

class TagModel{
    var name: String?
    
    init(name: String){
        self.name = name
    }
}
