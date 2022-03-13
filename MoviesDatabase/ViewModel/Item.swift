//
//  Item.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation


import Foundation


struct Item<T> {
    
    typealias CallBack = (T) -> Void
    
    var callBack : CallBack?
    
    var value : T {
        didSet {
            callBack?(value)
        }
    }
    
    init(value : T) {
        self.value = value
    }
    
    mutating func bind(callBack : @escaping CallBack) {
        self.callBack = callBack
    }
    
}
