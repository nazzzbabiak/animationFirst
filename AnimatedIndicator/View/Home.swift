//
//  Home.swift
//  AnimatedIndicator
//
//  Created by Nazar Babyak on 17.01.2022.
//


import SwiftUI

struct Home: View {
    
    var screenSize: CGSize
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        VStack{
            
            Button {
                
            } label: {
                    
                    Image(systemName: "person")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 33, height: 33)
                
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetPageView(offset: $offset) {
                
                HStack(spacing: 0) {
                    
                    ForEach(intros) {intro in
                    
                    VStack{
                        
                        Image(intro.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: screenSize.height / 2)
                        
                        VStack(alignment: .leading, spacing: 33) {
                            
                            Text(intro.title)
                                .font(.largeTitle.bold())
                            
                            Text(intro.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            
                        }
                        .foregroundStyle(.white)
                        .padding(.top,50)
                        .frame(width: .infinity, alignment: .leading)
                        
                        }
                    .padding()
                    .frame(width: screenSize.width)
                    }
                 }
              }
            
            HStack(alignment: .bottom) {
                
                HStack(spacing: 15) {
                    ForEach(intros.indices,id: \.self) {index in
                        Capsule()
                            .fill(.white)
                        
                            .frame(width: getIndex() == index ? 20 : 10 , height: 10)
                            
                    }
                }
                .overlay(
                
                    Capsule()
                        .fill(.white)
                        .frame(width: 22, height: 15)
                        .offset(x: getIndicatorOffset())
                    
                    ,alignment: .leading
                
                
                )
                .offset(x: 15, y: -10)
                
                Spacer()
                
                Button{
                    
                    let index = min(getIndex() + 1 , intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                    Image(systemName: "chevron.right.circle")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(6)
                        .background(
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }
            }
            .padding()
            .offset(y: -20)
          }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        .animation(.easeInOut, value: getIndex())
      
    }
    
    func getIndicatorOffset() -> CGFloat {
        
        let progres = offset / screenSize.width
        
        let maxWidht: CGFloat = 12 + 7
        
        return progres * maxWidht
    }
    
    
    func getIndex() -> Int {
        
        let progres = round(offset / screenSize.width)
        
        let index = min(Int(progres), intros.count - 1)
        
        return index
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
