//
//  SelectIconView.swift
//  Countdown
//
//  Created by cnwang on 2021/5/7.
//

import SwiftUI

struct SelectIconView: View {
    //MARK: - PROPERTIES
    var gridLayout: [GridItem]{
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 6)
    }
    @State var selectedIcon = IconData(name: "tesla.white")
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var countdownVM: CountdownViewModel
    
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - BODY
    /// <#Description#>
    var body: some View {
        GeometryReader { geometry in
            
            
            NavigationView {
                VStack (alignment: .center){
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.purple.opacity(0.3), lineWidth: 3)
                            .shadow(radius: 10)
                            //                            .foregroundColor(.yellow.opacity(0.1))
                            .frame(width: 100, height: 100, alignment: .center)
                        Image(countdownVM.iconName )
                            .resizable()
                            .scaledToFit()
                            .frame(width:64, height:64)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(style: FillStyle())
                            .foregroundColor(.yellow.opacity(0.1))
                        
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, pinnedViews: []){
                                ForEach(icons, id: \.id) {icon in
                                    IconGridItemView(icon: icon)
                                        .shadow(radius: 10)
                                        .onTapGesture {
                                            haptic.impactOccurred()
                                            print (icon.name)
                                            
                                            countdownVM.iconName = icon.name
                                        }
                                }
                            }
                            .padding(10)
                            .animation(.easeInOut(duration: 0.3))
                            .padding(.horizontal, 30)
                            //                        .frame(width: (24 * 6 + 10 * 5), height: 90, alignment: .center)
                        }
                        //                        .frame(width: 100, height: 100, alignment: .center)
                        //                        .background(Color.yellow.opacity(0.2))
                    }
                    .frame(height:300)
                    
                    Spacer()
                    Button(action: {
                        countdownVM.save()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Close")
                            .font(.title)
                        
                    })
                    
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        Text("Select Icon")
                            .font(.title)
                    })
//                    ToolbarItem(placement: .navigationBarTrailing, content: {
//                        Button(action: {
//                            countdownVM.save()
//                            presentationMode.wrappedValue.dismiss()
//                        }, label: {
//                            Image(systemName: "arrow.turn.right.up")
//                        })
//                    })
                    
                })
            }
            
        }
        
        
    }
}



//MARK: - PREVIEW
struct SelectIconView_Previews: PreviewProvider {
    static var previews: some View {
        SelectIconView(countdownVM: CountdownViewModel())
        
    }
}
