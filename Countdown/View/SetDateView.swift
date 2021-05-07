//
//  SetDateView.swift
//  Countdown
//
//  Created by cnwang on 2021/4/30.
//

import SwiftUI

struct SetDateView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @StateObject var countdownVM: CountdownViewModel
    @State var isSelectIconShow: Bool = false
    @State var message: String = "ERROR"
    func sav_e(){
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(countdownVM.dateFrom, forKey: "dateFrom")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(countdownVM.dateTo, forKey: "dateTo")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(countdownVM.dateFromEnabled, forKey: "dateFromEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(countdownVM.dateToEnabled, forKey: "dateToEnabled")
        UserDefaults(suiteName: "group.com.cnwang")?.setValue(countdownVM.title, forKey: "title")
        
    }
    //MARK: - BODY
    var body: some View {
        
        NavigationView{
            VStack{
                Section(header: Text("設定起始/結束 日期")){
                    Toggle(isOn: $countdownVM.dateFromEnabled, label: {
                        Text("起始")
                    })
                    .onChange(of: countdownVM.dateFromEnabled, perform: { value in
                        if !countdownVM.dateToEnabled && !countdownVM.dateFromEnabled {
                            countdownVM.dateFromEnabled.toggle()
                        }
                    })
                    
                    DatePicker("Start from", selection: $countdownVM.dateFrom)
                        .disabled(!countdownVM.dateFromEnabled)
                    
                    Toggle(isOn: $countdownVM.dateToEnabled, label: {
                        Text("結束")
                    })
                    .onChange(of: countdownVM.dateToEnabled, perform: { value in
                        if !countdownVM.dateToEnabled && !countdownVM.dateFromEnabled {
                            countdownVM.dateToEnabled.toggle()
                        }
                    })
                    DatePicker("End at", selection: $countdownVM.dateTo)
                        .disabled(!countdownVM.dateToEnabled)
                    HStack{
                        Text("Subject")
                        Spacer()
                            
                        TextField("UNTITLED", text: $countdownVM.title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Image(countdownVM.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24, alignment: .center)
                            .onTapGesture {
                                isSelectIconShow.toggle()
                            }
                    }
                    
                    GroupBox(label: Text("說明")){
                        Text("有設定起始, 有設定結束 --> 顯示今天的百分比")
                        Text("無設定起始, 有設定結束 --> 顯示剩餘的天數")
                        Text("有設定起始, 無設定結束 --> 顯示已經過的天數")
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 2)
                    
                    
                } //: Section
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Spacer()
                Button(action: {
                    if countdownVM.dateFrom.fullDistance(from: countdownVM.dateTo, resultIn: .hour) ?? 0 > 0 {
                        message = ""
                        countdownVM.save()
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        message = "起始日 晚於 結束日期"
                    }
                }, label: {
                    Text("Finish")
                })
                
                .padding(.horizontal,30)
                .padding(.vertical,10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                Text(message)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
//                    .animation(.interactiveSpring())
            }
            .navigationTitle("Setting Dates")
        }
        .sheet(isPresented: $isSelectIconShow, onDismiss: {}, content: {
                SelectIconView(countdownVM: countdownVM)
        })
    }
}


//MARK: - PREVIEW
struct SetDateView_Previews: PreviewProvider {
    static var previews: some View {
        SetDateView( countdownVM: CountdownViewModel())
    }
}
