//
//  SearchView.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @State private var showCancelButton: Bool = false
    
    var body: some View {

        return NavigationView {
            VStack {
                HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")

                            TextField("Search", text: $viewModel.searchText, onEditingChanged: { isEditing in
                                //self.viewModel.setCountrySearchText(text)
                                //self.viewModel.countrySearchText = text
                                showCancelButton = true
                            }).foregroundColor(.primary)

                            Button(action: {
                                viewModel.searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill").opacity(viewModel.searchText == "" ? 0 : 1)
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                        .foregroundColor(.secondary)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10.0)

                        if showCancelButton  {
                            Button("Cancel") {
                                    UIApplication.shared.endEditing(true)
                                    showCancelButton = false
                                    viewModel.searchText = ""
                            }
                            .foregroundColor(Color(.systemBlue))
                        }
                    }
                    .padding(.horizontal)
                    .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
                List {
                    // Filtered list of names
                    ForEach(viewModel.countries, id:\.self) { country in
                        HStack {
                            NavigationLink(destination: SearchDetailView(country: country)) {
                                HStack {
                                    Text(country.Country ?? "Hi")
                                }
                            }
                        }
                        
                    }
                }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}

struct SearchDetailView: View {
    @ObservedObject var viewModel: CountryDetailViewModel
    
    init(country: Country) {
        viewModel = CountryDetailViewModel(country: country)
    }
    
    var body: some View {
        Form {
            Section {
                Text("Country detail data here")
            }
        }
        .navigationBarTitle(Text(viewModel.country.Country ?? "Country Detail"))
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
