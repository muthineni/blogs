//
//  ParentView.swift
//  SwiftUIState Examples
//
//  Created by Sridhar Muthineni on 21/10/2024.
//

import SwiftUI

struct ParentView: View {
    @State private var isOn = false

    var body: some View {
        VStack {
            ToggleSwitch(isOn: $isOn)
            Text("Toggle switch is on: \(isOn)")
        }
        .padding()
    }
}

struct ToggleSwitch: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Toggle Switch", isOn: $isOn)
    }
}

#Preview {
    ParentView()
}
