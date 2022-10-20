//
//  String-EmptyCheck.swift
//  Bookworm
//
//  Created by Frédéric Helfer on 20/10/22.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
