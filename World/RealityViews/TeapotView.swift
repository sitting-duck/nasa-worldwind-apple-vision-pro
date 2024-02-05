//
//  TeapotView.swift
//  World
//
//  Created by Ashley on 2/2/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct TeapotView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Image("teapot")
            .clipShape(Circle())
    }
}

#Preview {
    TeapotView()
}
