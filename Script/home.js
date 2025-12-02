import { recipes } from "./receipe.js";

document.addEventListener("DOMContentLoaded", () => {
  const searchBar = document.getElementById("searchBar");
  const recipesContainer = document.getElementById("recipesContainer");

  function renderRecipes(filteredRecipes) {
    recipesContainer.innerHTML = "";
    filteredRecipes.forEach((recipe) => {
      const recipeTile = document.createElement("div");
      recipeTile.classList.add("recipe-tile");
      recipeTile.innerHTML = `
                <img src="${recipe.image}" alt="${recipe.name}">
                <div class="recipe-info">
                    <h3>${recipe.name}</h3>
                    <div class="recipe-meta">
                        <span class="recipe-rating">★ ${recipe.rating}</span>
                        <span class="recipe-tag">${recipe.cuisine}</span>
                    </div>
                </div>
            `;

      recipeTile.addEventListener("click", () => {
        window.location.href = `recipe.html?id=${recipe.id}`;
      });

      recipesContainer.appendChild(recipeTile);
    });
  }

  searchBar.addEventListener("input", () => {
    const query = searchBar.value.toLowerCase();
    const filteredRecipes = recipes.filter(
      (recipe) =>
        recipe.name.toLowerCase().includes(query) ||
        recipe.ingredients.some((ingredient) =>
          ingredient.toLowerCase().includes(query)
        )
    );

    renderRecipes(filteredRecipes);
  });

  renderRecipes(recipes);
});
