//
//  Theme+OpenBytes.swift
//  
//
//  Created by Leif on 11/30/21.
//

import Publish

extension Theme {
    static var openBytes: Theme {
        Theme(
            htmlFactory: OpenBytesHTMLFactory(),
            resourcePaths: ["Resources/css/styles.css"]
        )
    }
}
