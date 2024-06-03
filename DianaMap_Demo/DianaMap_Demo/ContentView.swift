//
//  ContentView.swift
//  DianaMap_Demo
//
//  Created by Yejin Hong on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var draw: Bool = false
    
    var body: some View {
        KakaoMapView(draw: $draw).onAppear(perform: {
            self.draw = true
        }).onDisappear(perform: {
            self.draw = false
        }).frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
