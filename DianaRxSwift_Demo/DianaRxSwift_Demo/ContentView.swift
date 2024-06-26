//
//  ContentView.swift
//  DianaRxSwift_Demo
//
//  Created by Yejin Hong on 6/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            SecondViewModel().execute()
        }
    }
}

#Preview {
    ContentView()
}
