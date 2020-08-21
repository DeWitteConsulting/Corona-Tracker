//
//  SearchBars.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI


//struct SearchBar: UIViewRepresentable {
//    @Binding var text: String
//
//    class Coordinator: NSObject, UISearchBarDelegate {
//
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            text = searchText
//        }
//
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.text = ""
//            searchBar.resignFirstResponder()
//            searchBar.showsCancelButton = false
//            searchBar.endEditing(true)
//            UIApplication.shared.endEditing()
//        }
//
//        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//            searchBar.showsCancelButton = true
//        }
//    }
//
//    func makeCoordinator() -> SearchBar.Coordinator {
//        return Coordinator(text: $text)
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.autocapitalizationType = .none
//        return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        uiView.text = text
//    }
//}
//
//struct LiveSearchBar: UIViewRepresentable {
//    @Binding var text: String
//
//    class Coordinator: NSObject, UISearchBarDelegate {
//
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            text = searchText
//        }
//
//        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//            searchBar.text = ""
//            searchBar.resignFirstResponder()
//            searchBar.showsCancelButton = false
//            searchBar.endEditing(true)
//            UIApplication.shared.endEditing()
//        }
//
//        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//            searchBar.showsCancelButton = true
//        }
//    }
//
//    func makeCoordinator() -> LiveSearchBar.Coordinator {
//        return Coordinator(text: $text)
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<LiveSearchBar>) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.autocapitalizationType = .none
//        return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<LiveSearchBar>) {
//        uiView.text = text
//    }
//}
//
//
//
//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(text: .constant(""))
//    }
//}
