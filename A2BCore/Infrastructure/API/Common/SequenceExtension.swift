//
//  SequenceExtension.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 03/03/2021.
//

import Foundation

extension Sequence {
    
    public func asArray() -> [Element] {
        return map { return $0 }
    }
}
