package dev.dschmidt.foodkmm.interactors.recipe_details

import dev.dschmidt.foodkmm.datasource.network.RecipeService
import dev.dschmidt.foodkmm.domain.model.GenericMessageInfo
import dev.dschmidt.foodkmm.domain.model.Recipe
import dev.dschmidt.foodkmm.domain.model.UIComponentType
import dev.dschmidt.foodkmm.domain.util.DataState
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

class GetRecipe(private val recipeService: RecipeService) {

    fun execute(recipeId: Int): Flow<DataState<Recipe>> = flow {
        emit(DataState.loading())
        try {

            kotlinx.coroutines.delay(2000)

            emit(DataState.data(data = recipeService.get(recipeId)))
        } catch (e: Exception) {
            emit(DataState.error<Recipe>(
                GenericMessageInfo
                    .Builder()
                    .id("SearchRecipes.Error")
                    .title("Error")
                    .uiComponentType(UIComponentType.Dialog)
                    .description(e.message ?: "Unknown Error")
                    .throwable(e)
                    .build())
            )
        }
    }
}