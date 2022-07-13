//
//  ContentView.swift
//  MyMovie
//
//  Created by Maha Alhathloul on 21/11/1443 AH.


import SwiftUI
import SceneKit

struct HomeView: View {
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @StateObject var viewModel = MovieVM()
    
    @State var presentAdventureView: Bool = false
    @State var presentRomanceView: Bool = false
    @State var presentComedyView: Bool = false
    @State var presentActionView: Bool = false
    @State var presentMysteryView: Bool = false
    @State var presentHorrorView: Bool = false
    @State var presentAnimationView: Bool = false
    @State var presentCrimeView: Bool = false
    @State var presentDramaView: Bool = false
    
    var body: some View {
        ZStack {
        
            
            Rectangle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.backGround,.rectangleColor]),
                                    center: .topLeading,
                                    angle: .degrees(-10))
                    
                    
                )
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                
                Image("AppIconImage")
                    .resizable()
                    .frame(width:83,height:112)
                    .padding()
                
                Text("How are you feeling now?")
                    .font(.system(size: 28, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .padding(.bottom , 30)
                
                
                //MARK: First HStack
                firstHStack
                
                //MARK: Second HStack
                secondHStack
                
                //MARK: Third HStack
                thirdHStack
                
                
                Spacer()
                
                
            }
            
            
        }
        .fullScreenCover(isPresented: $isFirstLaunch, content: {
            ZStack {
                Color.backGround
                    .ignoresSafeArea()
                VStack {
                    
                    Spacer()
                        .frame(height:10)
                    SceneView(
                        scene: {
                            let scene = SCNScene(named: "Emoji_Dice.usdz")!
                            scene.background.contents = UIColor(Color.backGround) /// here!
                            return scene
                        }(),
                        options: [.autoenablesDefaultLighting,.allowsCameraControl]
                    )
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .center)
                    .overlay(alignment: .topTrailing) {
                        VStack {
                            HStack(spacing:1) {
                                Image(systemName: "arrow.down.backward")
                                    .foregroundColor(.gray)
                                    .font(.system(size:18))
                                
                                Text("Roll it!")
                                    .foregroundColor(.gray)
                                    .font(.system(size:20))
                                
                            }
                            .padding([.top ,.horizontal])
                        }
                    }
                    
                        VStack(alignment:.center) {
                            
                            Text("Find Movies🔍")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top , 40)
                                .padding(.bottom , 10)
                            
                            Text("Discover top-rated movies that matches your mood with just ONE CLICK!")
                                .font(.system(size: 20, weight: .regular, design: .rounded))
                                .foregroundColor(.gray)
                         .multilineTextAlignment(.center)
                            .padding(.horizontal , 10)
                            .padding(.bottom , 40)
                        
                            
                            Spacer()
                            
                            
                            Button {
                                isFirstLaunch.toggle()
                            } label: {
                                Text("Get Started")
                                    .font(.system(size:24 , weight:.bold,design: .rounded))
                                    .foregroundColor(.black)
                                    .padding(5)
                                    .padding(.horizontal,10)
                                    .background(Color.rectangleColor)
                                    .cornerRadius(30)
                            }
                            
                            
                            Spacer()
                        }
                                
                    
                    
                }
                
            }
        })
        
    }
}

extension HomeView {
    
    var firstHStack: some View {
        
        HStack(spacing:18){
            
            Button {
                presentAdventureView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("😄")
                            .font(.system(size: 30))
                        Text("Cheerful")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentAdventureView) {
                AdventureMovieView(presentView: $presentAdventureView).environmentObject(viewModel)
            }
            
            
            
            Button {
                presentComedyView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("🤣")
                            .font(.system(size: 30))
                        Text("Humorous")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentComedyView) {
                ComedyMovieView(presentView: $presentComedyView).environmentObject(viewModel)
            }
            
            
            
            Button {
                presentRomanceView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("🥰")
                            .font(.system(size: 30))
                        Text("Romantic")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentRomanceView) {
                RomanceMovieView(presentView: $presentRomanceView).environmentObject(viewModel)
            }
        }
        .padding()
    }
    
    var secondHStack: some View {
        
        HStack(spacing:18) {
            
            
            Button {
                presentActionView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("🤯")
                            .font(.system(size: 30))
                        Text("Thrill\n-Seeking")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentActionView) {
                ActionMovieView(presentView: $presentActionView).environmentObject(viewModel)
            }
            
            
            Button {
                presentMysteryView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("😕")
                            .font(.system(size: 30))
                        Text("Gloomy")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentMysteryView) {
                MysteryMovieView(presentView: $presentMysteryView).environmentObject(viewModel)
            }
            
            
            
            
            Button {
                presentHorrorView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("😱")
                            .font(.system(size: 30))
                        Text("Fearful")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentHorrorView) {
                HorrorMovieView(presentView: $presentHorrorView).environmentObject(viewModel)
            }
            
            
            
        }
        .padding()
    }
    
    var thirdHStack: some View {
        
        HStack (spacing:18){
            
            Button {
                presentAnimationView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("🤪")
                            .font(.system(size: 30))
                        Text("Playful")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentAnimationView) {
                AnimationMovieView(presentView: $presentAnimationView).environmentObject(viewModel)
            }
            
            Button {
                presentCrimeView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("😡")
                            .font(.system(size: 30))
                        Text("Angry")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentCrimeView) {
                CrimeMovieView(presentView: $presentCrimeView).environmentObject(viewModel)
            }
            
            Button {
                presentDramaView.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.rectangleColor)
                        .frame(width:110 , height:80)
                    VStack{
                        Text("😢")
                            .font(.system(size: 30))
                        Text("Weepy")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                }
            }.fullScreenCover(isPresented: $presentDramaView) {
                DramaMovieView(presentView: $presentDramaView).environmentObject(viewModel)
            }
        }
        .padding()
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension Color {
    
    static let backGround = Color("BackgroundColor")
    static let rectangleColor = Color("RectangleColor")
}
