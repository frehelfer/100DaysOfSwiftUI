//
//  ScrollingTests.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 06/10/22.
//

import SwiftUI

struct ScrollingTests: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollingTests_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingTests()
    }
}
