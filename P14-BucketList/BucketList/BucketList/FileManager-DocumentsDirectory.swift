//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Frédéric Helfer on 05/11/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
