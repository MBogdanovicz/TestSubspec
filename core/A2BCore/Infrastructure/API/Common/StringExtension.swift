//
//  StringExtension.swift
//  LinkBeyond
//
//  Created by Marcelo Bogdanovicz on 10/01/2021.
//  Copyright © 2021 A-to-Be. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    
    public var emptyIfNil: String {
        guard let strongSelf = self else {
            return ""
        }
        return strongSelf.isEmpty ? "" : strongSelf
    }
}
