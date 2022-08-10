//
//  SearchBar.swift
//  GoodTextField
//
//  Created by Ryo on 2022/08/09.
//

import SwiftUI

struct SearchBar: View {
    
    @State var Label: String
    @Binding var Value: String
    @FocusState var isForcused: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            HStack{
                
                Image(systemName: "magnifyingglass")
                
                TextField(text: $Value) {
                    Text(Label)
                        .foregroundColor(Color.gray)
                }
                .focused($isForcused)
                .foregroundColor(Color.primary)
                
                if !Value.isEmpty {
                    Button {
                        Value = ""
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
                Value = ""
                isForcused = false
            } label: {
                Text("キャンセル")
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
        SearchBar(Label: "検索", Value: .constant(""))
    }
}
