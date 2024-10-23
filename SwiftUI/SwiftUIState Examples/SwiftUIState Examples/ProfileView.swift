//
//  ProfileView.swift
//  SwiftUIState Examples
//
//  Created by Sridhar Muthineni on 21/10/2024.
//

import SwiftUI

class ProfileModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var isMarried: Bool = false
}

struct ProfileView: View {
    @StateObject var profile = ProfileModel()
    var body: some View {
        VStack {
            Text("Profile Edit")
                .font(.headline)
            TextField("Name", text: $profile.name)
                .padding()
            TextField("Age", text: $profile.age)
                .padding()
            Toggle("Married", isOn: $profile.isMarried)
            
            Spacer()
            
            Text("Profile Details")
                .font(.headline)
            Text("Name: \(profile.name)")
            Text("Age: \(profile.age)")
            Text("Married: \(profile.isMarried)")
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
