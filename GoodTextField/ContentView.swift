//
//  ContentView.swift
//  GoodTextField
//
//  Created by Ryo on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    @State var Value = ""
    var body: some View {
        VStack {
            Text(Value)
            SearchBar(Label: "検索", Value: $Value)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
