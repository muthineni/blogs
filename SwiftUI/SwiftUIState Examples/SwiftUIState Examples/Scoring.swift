//
//  Scoring.swift
//  SwiftUIState Examples
//
//  Created by Sridhar Muthineni on 21/10/2024.
//

import SwiftUI

class ScoreBoard: ObservableObject {
    @Published var score = 0
}

struct ScoreView: View {
    @EnvironmentObject var scoreboard: ScoreBoard

    var body: some View {
        Text("Score: \(scoreboard.score)")
    }
}

struct ScoringView: View {
    @StateObject var scoreboard = ScoreBoard()

    var body: some View {
        NavigationStack {
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    scoreboard.score += 1
                }

                NavigationLink {
                    ScoreView()
                } label: {
                    Text("Show Scorecard")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(scoreboard)
    }
}

#Preview {
    ScoringView()
}
