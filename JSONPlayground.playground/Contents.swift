import UIKit


if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"), let pokemonData = try? Data(contentsOf: pokemonURL){
    print(pokemonURL)
    print(pokemonData)
}
else{
    print("Something went wrong")
}

