//
//  HomeViews.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/9/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        return NavigationView {
            Form {
                Section(header: Text("Global Summary").font(.headline)) {
                    
                        HStack {
                            Text("New Confirmed Cases: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.NewConfirmed ?? 0))
                        }
                        HStack {
                            Text("Total Confirmed Cases: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.TotalConfirmed ?? 0))
                        }
                        HStack {
                            Text("New Deaths: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.NewDeaths ?? 0))
                        }
                        HStack {
                            Text("Total Deaths: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.TotalDeaths ?? 0))
                        }
                        HStack {
                            Text("New Recovered: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.NewRecovered ?? 0))
                        }
                        HStack {
                            Text("Total Recovered: ")
                            Spacer()
                            Text(String(viewModel.summary.Global?.TotalRecovered ?? 0))
                        }
                    
                }
//                //Fix next
//                Section(header: Text("Countries").font(.headline)) {
//                    List (viewModel.countries, id: \.id) { country in
//                        NavigationLink(
//                         destination: Text("")) {
//                            Text(country.Country ?? "")
//                        }
//                    }
//                }
            }
            .navigationTitle("Summary")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
