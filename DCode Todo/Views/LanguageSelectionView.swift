//
//  LanguageSelectionView.swift
//  DCode Todo
//
//  Created by Akito Daiki on 15/7/2566 BE.
//

import SwiftUI

struct LanguageSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("appLanguage") var appLanguage = "English" // App language default value is English
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Language")) {
                    Button(action: {
                        appLanguage = "English"
                        setAppLanguage("English")
                        DispatchQueue.main.async {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        HStack {
                            Text("English")
                            Spacer()
                            if appLanguage == "English" {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                    Button(action: {
                        appLanguage = "Thai"
                        setAppLanguage("th")
                        DispatchQueue.main.async {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        HStack {
                            Text("Thai")
                            Spacer()
                            if appLanguage == "Thai" {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                    Button(action: {
                        appLanguage = "Burmese"
                        setAppLanguage("my")
                        DispatchQueue.main.async {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        HStack {
                            Text("Burmese")
                            Spacer()
                            if appLanguage == "Burmese" {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Change Language")
        }
    }
    
    func setAppLanguage(_ languageCode: String) {
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}


struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView()
    }
}

//extension Bundle {
//    // Function to set the app's language
//    static func setLanguage(_ languageCode: String) {
//        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()
//    }
//}
