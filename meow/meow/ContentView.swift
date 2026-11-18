//
//  ContentView.swift
//  meow
//
//  Created by Hazel Cheng on 18/11/2026.
//

import SwiftUI


struct Player: Identifiable {
    let id = UUID()
    let name: String
    let avatar: String
}
struct ContentView: View {
    let players = [
        Player(name: "Hazelnut", avatar: "🐱"),
        Player(name: "Shiela", avatar: "🖥️"),
        Player(name: "Audrey", avatar: "☺️")
    ]
    var body: some View {
        NavigationStack {
            List(players) { player in
                NavigationLink{
                    playerdetailview(player: player)
                } label: {
                    Label(player.name, systemImage: "person")
                }
            }
            .navigationTitle("Players")
        }
    }
}
struct playerdetailview: View {
    let player: Player
    var body: some View {
        VStack(spacing: 16){
            Text(player.avatar)
                .font(.system(size:100))
            Text(player.name)
                .font(.system(size:100))
        }
        .navigationTitle(player.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    ContentView()
}
