//
//  AnimationMovieView.swift
//  MyMovie
//
//  Created by Maha Alhathloul on 27/11/1443 AH.
//

import SwiftUI
import Kingfisher

struct AnimationMovieView: View {
    @EnvironmentObject var viewModel : MovieVM
    @Binding var presentView:Bool
    
    var body: some View {
        ZStack() {
            //Poster
            KFImage(URL(string: viewModel.newAnimationMovies.poster)!)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                //Dissmis & Other movie button
                HStack {
                    Button {
                        presentView = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(9)
                            .background(VisualEffectView(effect: UIBlurEffect(style: .dark))
                                .cornerRadius(8))
                            .padding([.horizontal,.top])
                        
                    }.frame(maxWidth:.infinity , alignment: .leading)
                    
                    
                    Button {
                        viewModel.calculateForAnimationMovies()
                    } label: {
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(9)
                            .background(VisualEffectView(effect: UIBlurEffect(style: .dark))
                                .cornerRadius(8))
                            .padding([.horizontal,.top])
                    }
                    .frame(maxWidth:.infinity ,alignment: .trailing)
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    //Movie name &  release Date
                    
                    HStack(spacing: 5) {
                        Text(viewModel.newAnimationMovies.name)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        
                        +  Text(" (\(viewModel.newAnimationMovies.releaseDate))")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                    }
                    .padding(.horizontal , 10)
                    .padding(.top , 5)
                    
                    //Movie rating
                    
                    HStack(spacing: 10) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width:20 , height:20)
                            .foregroundColor(.yellow)
                        
                        Text(viewModel.newAnimationMovies.rating.description)
                            .font(.system(size:20 , weight: .medium))
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal , 10)
                    
                    
                    //Movie category
                    
                    HStack{
                        ForEach(viewModel.newAnimationMovies.category , id: \.self){ item in
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 30)
                                    .foregroundColor(.backGround)
                                    .cornerRadius(12)
                                    .opacity(0.4)
                                
                                Text(item)
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity , alignment : . leading)
                    .padding(.horizontal , 10)
                    
                    //Movie description
                    
                    Text(viewModel.newAnimationMovies.description)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular, design: .rounded))
                        .padding(.horizontal , 10)
                    
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 30 )
                .background(VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .cornerRadius(25)
                            
                )
                
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        .onAppear(){viewModel.fakeNetworkCall()}
        
    }
}
    

struct AnimationMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationMovieView(presentView: .constant(true))
    }
}
