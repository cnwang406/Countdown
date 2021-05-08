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
                Section(header: Text("Set FROM / TO date")){
                    Toggle(isOn: $countdownVM.dateFromEnabled, label: {
                        Text("FROM")
                    })
                    .onChange(of: countdownVM.dateFromEnabled, perform: { value in
                        if !countdownVM.dateToEnabled && !countdownVM.dateFromEnabled {
                            countdownVM.dateFromEnabled.toggle()
                        }
                    })
                    
                    DatePicker("Start from", selection: $countdownVM.dateFrom)
                        .disabled(!countdownVM.dateFromEnabled)
                    
                    Toggle(isOn: $countdownVM.dateToEnabled, label: {
                        Text("TO")
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
                    
                    GroupBox(label: Text("Description")){
                        Text("FROM set, TO set --> shows percentage")
                        Text("FROM not set, TO set --> shows left days")
                        Text("FROM set, TO not set --> shows elapsed days")
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
