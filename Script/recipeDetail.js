import { recipes } from "./receipe.js";

document.addEventListener("DOMContentLoaded", () => {
    const params = new URLSearchParams(window.location.search);
    const recipeId = parseInt(params.get("id"));

    const recipe = recipes.find(r => r.id === recipeId);

    if (recipe) {
        document.getElementById("recipeImage").src = recipe.image;
        document.getElementById("recipeName").innerText = recipe.name;
        document.getElementById("recipeDifficulty").innerText = recipe.difficulty;
        document.getElementById("prepTime").innerText = recipe.prepTimeMinutes;
        document.getElementById("cookTime").innerText = recipe.cookTimeMinutes;
        document.getElementById("servings").innerText = recipe.servings;
        document.getElementById("calories").innerText = recipe.caloriesPerServing;

        const ingredientsList = document.getElementById("ingredientsList");
        recipe.ingredients.forEach(ingredient => {
            const li = document.createElement("li");
            li.textContent = ingredient;
            ingredientsList.appendChild(li);
        });

        const instructionsList = document.getElementById("instructionsList");
        recipe.instructions.forEach(instruction => {
            const li = document.createElement("li");
            li.textContent = instruction;
            instructionsList.appendChild(li);
        });
    } else {
        document.getElementById("recipeContainer").innerHTML = "<h2>Recipe not found</h2>";
    }

    document.getElementById("backButton").addEventListener("click", () => {
        window.location.href = "index.html";
    });
});
