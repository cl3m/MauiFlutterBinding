//
//  ContentView.swift
//  DemoApp
//
//  Created by Clem on 25.10.22.
//

import SwiftUI
import Binding

struct ContentView: View {
    var body: some View {
        TabView {
            FlutterView()
                .tabItem {
                    Label("Flutter", systemImage: "1.circle")
                }
            TestView()
                .tabItem {
                    Label("Test", systemImage: "2.circle")
                }
            
        }
    }
}

struct TestView: View {
    @State var result: String?
    var body: some View {
        VStack(spacing: 20) {            
            if let result {
                Text(result)
            } else {
                Button("Async") {
                    result = "Loading ..."
                    SwiftBinding().async(parameters: ["Hello","world!"]) { result in
                        self.result = result
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlutterView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return SwiftBinding().getFlutterViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
