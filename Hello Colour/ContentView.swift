import SwiftUI

struct EasterEggView: View {
    var body: some View {
        VStack {
            Text("🐣 Congratulations!")
                .font(.largeTitle)
            Text("You found the Easter Egg!")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView: View {
    @State private var currentColorIndex = 0
    private let rainbowColors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    @State private var isEasterEggPresented = false // Tracks whether Easter Egg page should be shown

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.blue // AppBar background color
                        .ignoresSafeArea()
                    Text("My App")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                }
                .frame(height: 100)
                
                Spacer()
                
                Text("Welcome to My App")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    currentColorIndex = (currentColorIndex + 1) % rainbowColors.count
                }) {
                    Text("Hello World")
                        .padding()
                        .background(rainbowColors[currentColorIndex])
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
                
                Button(action: {
                    isEasterEggPresented = true
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isEasterEggPresented, content: {
                    EasterEggView()
                })
            }
            .background(Color.white)
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

