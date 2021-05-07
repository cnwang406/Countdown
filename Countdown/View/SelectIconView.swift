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
    
    //        let haptic = UIImpactFeedbackGenerator(style: .medium)
    //MARK: - BODY
    /// <#Description#>
    var body: some View {
        GeometryReader { geometry in
            
            
            NavigationView {
                VStack (alignment: .center){
                    HStack{
                        Text("Selected ")
                        Image(countdownVM.iconName )
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                    }
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, pinnedViews: []){
                            ForEach(icons, id: \.id) {icon in
                                IconGridItemView(icon: icon)
                                    .onTapGesture {
                                        print (icon.name)
                                        countdownVM.iconName = icon.name
                                        countdownVM.save()
                                    }
                            }
                        }
                        
                        .padding(10)
                        .animation(.easeInOut(duration: 1.0))
                        .frame(width: 24 * 6 + 10 * 5 , height: 90, alignment: .center)
                    }
                    
                }
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                                    Text("Select Icon")
                    })
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button(action: {
                            
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "gear")
                        })
                    })
                    
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
