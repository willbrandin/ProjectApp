//
//  ContentView.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ProjectListView()
                .navigationBarTitle("Projects")
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
