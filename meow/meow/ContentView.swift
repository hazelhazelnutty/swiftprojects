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
    @State private var player: [Player] = []
    @State private var addingnewplayer = false
    @State private var nameofplayer = ""
    @State private var emoji = ""
    @State private var players = [
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
            .navigationTitle("Players")            }
        HStack {
            Button("Add Player"){
                addingnewplayer = true
            }
            .alert("Adding Player", isPresented: $addingnewplayer){
                TextField("Add name here", text: $nameofplayer)
                TextField("Add avatar here", text: $emoji)
                Button("Submit Player"){
                    players.append(Player(name: nameofplayer, avatar: emoji))
                }
            }
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
