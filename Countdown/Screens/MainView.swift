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
    
    @State var onScreenShowed = UserDefaults(suiteName: "group.com.cnwang")?.onBoardScreenShow
    
    @State var isSettingViewShow: Bool = false
    @State var isAboutViewShow: Bool = false
    @State var isSelectIconView: Bool = false
    @State var isChangeTitleView: Bool = false
    @StateObject var countdownVM: CountdownViewModel = CountdownViewModel()
    var body: some View {
        
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .top){
                    
                    Image(countdownVM.iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120, alignment: .center)

                        .onTapGesture {
                            isSelectIconView.toggle()
                        }.offset(y: geometry.size.height * 0.1)
                        
                    Text(countdownVM.title)
                        .font(.title)
                        .onTapGesture {
                            isChangeTitleView.toggle()
                            countdownVM.save()
                            WidgetCenter.shared.reloadAllTimelines()
                        }
                        .offset(y: geometry.size.height * 0.35)

                    CountdownProgressView(countdownVM: countdownVM)
                        .offset(y: geometry.size.height * 0.45)
                    
                    DateDetailView(countdownVM: countdownVM)
                        .offset(y: geometry.size.height * 0.80)
                }
                
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar(content: {
                    ToolbarItem(placement: .principal, content: {
                        Text(NSLocalizedString("Days Left", comment: "default"))
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
                .sheet(isPresented: $isSelectIconView, onDismiss: {
                    WidgetCenter.shared.reloadAllTimelines()
                }, content: {
                    SelectIconView(countdownVM: countdownVM)})
                
                .sheet(isPresented: $isChangeTitleView, onDismiss: {
                    countdownVM.save()
                    WidgetCenter.shared.reloadAllTimelines()
                }, content: {
                    PopupTextView(title: "Change Subject", textEntered: $countdownVM.title, showingAlert: $isChangeTitleView)
            })
                .sheet(isPresented: $onScreenShowed, onDismiss: {
                    UserDefaults(suiteName: "group.com.cnwang")?.setValue(false, forKey: "onScreenShowed")
                    
                    
                }, content: {
                    OnBoardScreen()
                })
            }
            
            
        }//: NavigationView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        MainView()
        MainView()
            .environment(\.colorScheme, .dark)
            
        }
            
    }
}
