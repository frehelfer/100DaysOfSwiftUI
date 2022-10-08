//
//  Experiment.swift
//  MoonShot
//
//  Created by Frédéric Helfer on 06/10/22.
//

import SwiftUI

struct Experiment: View {
    var body: some View {
      GeometryReader { geo in
        Image("IMG_8549")
          .resizable()
          .scaledToFit()
//          .frame(width: geo.size.width * 0.8)
          .frame(width: geo.size.width, height: geo.size.height)
      }
    }
}

struct Experiment_Previews: PreviewProvider {
    static var previews: some View {
        Experiment()
    }
}
