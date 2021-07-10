//
//  RecipeView.swift
//  iosApp
//
//  Created by Daniel Schmidt on 10.07.21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import shared

struct RecipeView: View {
    
    private let recipe: Recipe
    private let dateUtil: DatetimeUtil
    
    init(recipe: Recipe, dateUtil: DatetimeUtil) {
        self.recipe = recipe
        self.dateUtil = dateUtil
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: recipe.featuredImage))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.white)
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(height: 250, alignment: .center)
                    .clipped()
            }
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline) {
                    DefaultText("Updated \(dateUtil.humanizeDatetime(date: recipe.dateUpdated)) by \(recipe.publisher)")
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    DefaultText(String(recipe.rating))
                        .frame(alignment: .trailing)
                }
                ForEach(recipe.ingredients as Array<String>, id: \.self) { ingredient in
                    DefaultText(ingredient, size: 16)
                        .padding(.top, 4)
                }
            }
            .background(Color.white)
            .padding(12)
        }
        .navigationBarTitle(Text(recipe.title), displayMode: .inline)
    }
}

//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView()
//    }
//}
