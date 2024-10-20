//
//  ContentView.swift
//  ExToast2
//
//  Created by 심성곤 on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var toasts: [Toast] = []
    
    var body: some View {
        ZStack {
            Button("Present Toast") {
                showToast("Hello, World!", symbol: "globe")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .interactiveToasts($toasts)
    }
    
    func showToast(_ title: String, symbol: String? = nil) {
        withAnimation(.bouncy) {
            let toast = Toast() { id in
                ToastView(id: id, title: title, symbol: symbol)
            }
            toasts.append(toast)
        }
    }
    
    @ViewBuilder
    func ToastView(id: String, title: String, symbol: String?) -> some View {
        HStack(spacing: 12) {
            if let symbol {
                Image(systemName: symbol)
            }
            
            Text(title)
                .font(.callout)
            
            Spacer(minLength: 0)
            
            Button {
                $toasts.delete(id)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
            }
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background {
            Capsule()
                .fill(.background)
                .shadow(color: .black.opacity(0.06), radius: 3, x: -1, y: -3)
                .shadow(color: .black.opacity(0.06), radius: 2, x: 1, y: 3)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    ContentView()
}
