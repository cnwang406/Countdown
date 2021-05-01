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
    @State var std = UserDefaults.standard
    @State var dateFrom: Date = UserDefaults.standard.dateFrom
    @State var dateTo: Date = UserDefaults.standard.dateTo
    @State var dateFromEnabled: Bool = UserDefaults.standard.dateFromEnabled
    @State var dateToEnabled: Bool = UserDefaults.standard.dateToEnabled
    @State var title: String = UserDefaults.standard.title
    
    @State var message: String = "ERROR"
    func save(){
        UserDefaults.standard.setValue(dateFrom, forKey: "dateFrom")
        UserDefaults.standard.setValue(dateTo, forKey: "dateTo")
        UserDefaults.standard.setValue(dateFromEnabled, forKey: "dateFromEnabled")
        UserDefaults.standard.setValue(dateToEnabled, forKey: "dateToEnabled")
        UserDefaults.standard.setValue(title, forKey: "title")
    }
    //MARK: - BODY
    var body: some View {
        
        NavigationView{
            VStack{
                Section(header: Text("設定起始/結束 日期")){
                    Toggle(isOn: $dateFromEnabled, label: {
                        Text("起始")
                    })
                    .onChange(of: dateFromEnabled, perform: { value in
                        if !dateToEnabled && !dateFromEnabled {
                            dateFromEnabled.toggle()
                        }
                    })
                    
                    DatePicker("Start from", selection: $dateFrom)
                        .disabled(!dateFromEnabled)
                    
                    Toggle(isOn: $dateToEnabled, label: {
                        Text("結束")
                    })
                    .onChange(of: dateToEnabled, perform: { value in
                        if !dateToEnabled && !dateFromEnabled {
                            dateToEnabled.toggle()
                        }
                    })
                    DatePicker("End at", selection: $dateTo)
                        .disabled(!dateToEnabled)
                    HStack{
                        Text("Subject")
                        Spacer()
                            
                        TextField("UNTITLED", text: $title)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
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
                    if dateFrom.fullDistance(from: dateTo, resultIn: .hour) ?? 0 > 0 {
                        message = ""
                        self.save()
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
    }
}


//MARK: - PREVIEW
struct SetDateView_Previews: PreviewProvider {
    static var previews: some View {
        SetDateView()
    }
}
