//
//  ContentView.swift
//  SwiftUIZIndex
//
//  Created by Vitalij Dadaschjanz on 17.05.22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingOverlay = false
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                NavigationView {
                    Color.green
                        .navigationTitle("zIndex")
                }                
                .zIndex(1)
                
                if isShowingOverlay {
                    overlayView
                        .zIndex(2)
                }
            }
            
            Button {
                withAnimation {
                    isShowingOverlay.toggle()
                }
            } label: {
                Text("Toggle Overlay")
                    .foregroundColor(.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Private
    
    @ViewBuilder
    private var overlayView: some View {
        GeometryReader { reader in
            ZStack(alignment: .bottom) {
                Color.black.opacity(0.65)
                    .onTapGesture {
                        withAnimation {
                            isShowingOverlay = false
                        }
                    }
                    .transition(.opacity)
                
                Color.blue
                    .frame(height: reader.size.height / 1.5)
            }
        }
        .accessibilityAddTraits(.isModal)
    }
}
