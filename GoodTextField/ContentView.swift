//
//  ContentView.swift
//  GoodTextField
//
//  Created by Ryo on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        VStack {
            Text(text)
            
            SearchBar(text: $text, prompt: "検索")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
