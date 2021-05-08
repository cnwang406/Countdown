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
                            .frame(width: 48, height: 48, alignment: .center)
                            .onTapGesture {
                                isSelectIconShow.toggle()
                            }
                    }
                    
                    SetDateDescriptionView()
                    
                    
                } //: Section
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                
                Spacer()
                Text(message)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
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
                        .font(.title)
                })
                .padding(.horizontal,30)
                .padding(.vertical,10)

                    
//                    .animation(.interactiveSpring())
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text("Setting Date")
                        .font(.title)
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        countdownVM.save()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.turn.right.up")
                    })
                })
                
            }) //: toolbar
//            .navigationTitle("Setting Dates")
        } //: NavigationView
        .sheet(isPresented: $isSelectIconShow, onDismiss: {}, content: {
                SelectIconView(countdownVM: countdownVM)
            
        }) //.sheet
    }
}


//MARK: - PREVIEW
struct SetDateView_Previews: PreviewProvider {
    static var previews: some View {
        SetDateView( countdownVM: CountdownViewModel())
    }
}
