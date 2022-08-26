//
//  SearchBar.swift
//  GoodTextField
//
//  Created by Ryo on 2022/08/09.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @State var prompt: String
    @FocusState var isForcused: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                
                TextField(text: $text) {
                    Text(prompt)
                        .foregroundColor(Color.gray)
                }
                //キーボードのラベルを検索に
                .submitLabel(.search)
                .focused($isForcused)
                .foregroundColor(Color.primary)
                
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .buttonStyle(.plain)
                }
                
            }
            .foregroundColor(Color.gray)
            .padding(5.0)
            .background(Color(.tertiarySystemFill))
            .cornerRadius(10)
            
            Button {
                text = ""
                isForcused = false
            } label: {
                Text("キャンセル")
                    .foregroundColor(isForcused ? .blue : Color(.systemBackground))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .padding(.leading, isForcused ? 10 : -90)
            .offset(x:(isForcused ? 0 : 120) )
            
        }
        .padding()
        .animation(Animation.default, value: isForcused)
        .onAppear(){
            //起動時にTextFieldにForcusを当てるのかどうか
            isForcused = true
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), prompt: "検索")
    }
}
