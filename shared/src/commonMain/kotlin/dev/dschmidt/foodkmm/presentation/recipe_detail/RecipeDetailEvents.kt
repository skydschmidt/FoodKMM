package dev.dschmidt.foodkmm.presentation.recipe_detail

sealed class RecipeDetailEvents {

    data class GetRecipe(val recipeId: Int): RecipeDetailEvents()

    object OnRemoveHeadMessageFromQueue: RecipeDetailEvents()

}
