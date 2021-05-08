//
//  ContentView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/29.
//

import SwiftUI
import Foundation
import WidgetKit
struct MainView: View {
    
    
    @State var isSettingViewShow: Bool = false
    @State var isAboutViewShow: Bool = false
    @StateObject var countdownVM: CountdownViewModel = CountdownViewModel()
    var body: some View {
        NavigationView {
            VStack{
                Image("tesla.white")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240, alignment: .center)
                
                Text(countdownVM.title)
                    .font(.title)
                    .padding()
                
                CountdownProgressView(countdownVM: countdownVM)
                
                Spacer()
                DateDetailView(countdownVM: countdownVM)
                Spacer()
                
            }
            
            .padding()
            
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text(NSLocalizedString("Countdown", comment: "default"))
                        .font(.title)
                    
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        isSettingViewShow.toggle()
                    }, label: {
                        Image(systemName: "gear")
                    })
                })
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        isAboutViewShow.toggle()
                    }, label: {
                        Image(systemName: "info")
                    })
                })

                
            })
            .navigationViewStyle(StackNavigationViewStyle())
            .sheet(isPresented: $isSettingViewShow, onDismiss: {
                WidgetCenter.shared.reloadAllTimelines()
            }, content: {
                SetDateView(countdownVM: countdownVM)
            })
            .sheet(isPresented: $isAboutViewShow, onDismiss: {
                WidgetCenter.shared.reloadAllTimelines()
            }, content: {
                AboutView()
            })

        }//: NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
