//
//  ModelExtension.swift
//  LinkBeyond
//
//  Created by Marcelo Bogdanovicz on 08/01/2021.
//  Copyright © 2021 A-to-Be. All rights reserved.
//

import Foundation

extension Encodable {
    
    public var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}
