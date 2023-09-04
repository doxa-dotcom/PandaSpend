//
//  CategoryList.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-22.
//

import Foundation
struct CategoryList {
    var categories = [Category]()
    
    //Public Methods
    mutating func add(_ categoty: Category) {
        categories.append(categoty)
    }
}
