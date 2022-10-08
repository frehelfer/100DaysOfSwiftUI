//
//  Divider.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 07/10/22.
//

import SwiftUI

struct MyDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct Divider_Previews: PreviewProvider {
    static var previews: some View {
        MyDivider()
    }
}
