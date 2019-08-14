import UIKit

struct Ability: Decodable {
   let name: String
   let isHidden: Bool
    let slot: Int
    
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    enum AbilityCodingKeys: String, CodingKey{
        case name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
        name = try abilityContainer.decode(String.self, forKey: .name)
        isHidden = try container.decode(Bool.self, forKey: .isHidden)
        slot = try container.decode(Int.self, forKey: .slot)
    }
}

struct Forms: Decodable{
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}
struct GameIndices: Decodable{
    let name: String
    let gameIndex: Int
    
    
    enum CodingKeys: String, CodingKey {
        case version
        case gameIndex = "game_index"
    }
    
    enum GameIndicesCodingKeys: String, CodingKey{
        case name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let GameIndicesContainer = try container.nestedContainer(keyedBy: GameIndicesCodingKeys.self, forKey: .version)
        name = try GameIndicesContainer.decode(String.self, forKey: .name)
        gameIndex = try container.decode(Int.self, forKey: .gameIndex)
    }
    
}
struct Moves: Decodable{
    let name: String
    let versionGroupDetails: [VersionGroupDetails]
    
    
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    enum MoveCodingKeys: String, CodingKey{
        case name
        
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveContainer = try container.nestedContainer(keyedBy:MoveCodingKeys.self, forKey: .move)
        name = try moveContainer.decode(String.self, forKey: .name)
        versionGroupDetails = try container.decode([VersionGroupDetails].self, forKey: .versionGroupDetails)
    }
}

struct VersionGroupDetails: Decodable{
    let moveLearnMethodName: String
    let versionGroupName: String
    let levelLearnedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    enum MoveLearnMethodCodingKeys: String, CodingKey{
        case moveLearnMethodName = "name"
        
    }
    enum VersionGroupCodingKeys: String, CodingKey {
        case versionGroupName = "name"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        let moveLearnedMethodContainer = try container.nestedContainer(keyedBy: MoveLearnMethodCodingKeys.self, forKey: .moveLearnMethod)
        moveLearnMethodName = try moveLearnedMethodContainer.decode(String.self, forKey: .moveLearnMethodName)
        let versionGroupContainer = try container.nestedContainer(keyedBy: VersionGroupCodingKeys.self, forKey: .versionGroup)
        versionGroupName = try versionGroupContainer.decode(String.self, forKey: .versionGroupName)
    }
    
}

struct Stats: Decodable{
    let name: String
    let baseStat: Int
    let effort: Int
    
    
    enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
        case effort
    }
    
    enum StatsCodingKeys: String, CodingKey{
        case name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let statsContainer = try container.nestedContainer(keyedBy: StatsCodingKeys.self, forKey: .stat)
        name = try statsContainer.decode(String.self, forKey: .name)
        effort = try container.decode(Int.self, forKey: .effort)
        baseStat = try container.decode(Int.self, forKey: .baseStat)
    }
    
}
struct Types: Decodable{
    let name: String
    let slot: Int
    
    
    enum CodingKeys: String, CodingKey {
        case type
        case slot
    }
    
    enum TypesCodingKeys: String, CodingKey{
        case name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typesContainer = try container.nestedContainer(keyedBy: TypesCodingKeys.self, forKey: .type)
        name = try typesContainer.decode(String.self, forKey: .name)
        slot = try container.decode(Int.self, forKey: .slot)
    }
    
}
struct Sprites: Decodable{
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
 
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}
struct Species: Decodable {
    let name:String
}

struct Pokemon: Decodable{
    let name: String
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Forms]
    let gameIndices: [GameIndices]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Moves]
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stats]
    let types: [Types]
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case abilities
        case baseExperience = "base_experience"
        case forms
        case height
        case gameIndices = "game_indices"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
}



if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let pokemonData = try? Data(contentsOf: pokemonURL){
    
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData)
    print(pokemon)
    
}else {
    print("womething went wrong")
}
