//
//  Meal.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//

struct Meal: Decodable, Identifiable {
    var id: String
    
    let name: String
    let instructions: String?
    let ingredients: [String : String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        
        // Custom logic to handle dynamic keys for ingredients and measures - needed so we can properly key the container for decoding
        case ingredient1 = "strIngredient1"
        case measure1 = "strMeasure1"
        case ingredient2 = "strIngredient2"
        case measure2 = "strMeasure2"
        case ingredient3 = "strIngredient3"
        case measure3 = "strMeasure3"
        case ingredient4 = "strIngredient4"
        case measure4 = "strMeasure4"
        case ingredient5 = "strIngredient5"
        case measure5 = "strMeasure5"
        case ingredient6 = "strIngredient6"
        case measure6 = "strMeasure6"
        case ingredient7 = "strIngredient7"
        case measure7 = "strMeasure7"
        case ingredient8 = "strIngredient8"
        case measure8 = "strMeasure8"
        case ingredient9 = "strIngredient9"
        case measure9 = "strMeasure9"
        case ingredient10 = "strIngredient10"
        case measure10 = "strMeasure10"
        case ingredient11 = "strIngredient11"
        case measure11 = "strMeasure11"
        case ingredient12 = "strIngredient12"
        case measure12 = "strMeasure12"
        case ingredient13 = "strIngredient13"
        case measure13 = "strMeasure13"
        case ingredient14 = "strIngredient14"
        case measure14 = "strMeasure14"
        case ingredient15 = "strIngredient15"
        case measure15 = "strMeasure15"
        case ingredient16 = "strIngredient16"
        case measure16 = "strMeasure16"
        case ingredient17 = "strIngredient17"
        case measure17 = "strMeasure17"
        case ingredient18 = "strIngredient18"
        case measure18 = "strMeasure18"
        case ingredient19 = "strIngredient19"
        case measure19 = "strMeasure19"
        case ingredient20 = "strIngredient20"
        case measure20 = "strMeasure20"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)

        //process ingredients and measures
        var ingredientsAndMeasurements = [String : String]()
        for index in 1...20 {
            let ingredientKey = "strIngredient\(index)"
            let measureKey = "strMeasure\(index)"
            
            
            
            guard let ingredientCodingKey = CodingKeys.init(stringValue: ingredientKey),
                  let measureCodingKey = CodingKeys.init(stringValue: measureKey) else {
                continue
            }
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientCodingKey),
               let measure = try container.decodeIfPresent(String.self, forKey: measureCodingKey) {
                if !ingredient.isEmpty && !measure.isEmpty {
                    ingredientsAndMeasurements[ingredient] = measure
                }
            }
        }
        self.ingredients = ingredientsAndMeasurements.count > 0 ? ingredientsAndMeasurements : nil
    }
    
    init(id: String, name: String, instructions: String? = nil, ingredients: [String : String]? = nil) {
        self.id = id
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
    }
}



// Test Data for Preview
let testData = Meal(id: "123",
                    name: "Baklava",
                    instructions: """
                    For the biscuits, preheat the oven to 200C/180C (fan)/Gas 6 and line two large baking trays with baking parchment. Scatter the nuts over a baking tray and roast in the oven for 6-8 minutes, or until golden-brown. Watch them carefully so that they don't have a chance to burn. Remove from the oven, tip onto a board and leave to cool.
                    Put the butter and sugar in a large bowl and beat with a wooden spoon until light and creamy. Roughly chop the cooled nuts and add to the creamed butter and sugar, along with the lemon zest, flour and baking powder. Stir well until the mixture comes together and forms a ball – you may need to use your hands.
                    Divide the biscuit dough into 24 even pieces and roll into small balls. Place the balls the prepared baking trays, spaced well apart to allow for spreading.
                    Press the biscuits to flatten to around 1cm/½in thick. Bake the biscuits, one tray at a time, for 12 minutes or until very pale golden-brown. Leave to cool on the trays. They will be very soft when you take them out of the oven, but will crisp as they cool.
                    Store in an airtight tin and eat within five days.
                    For the fool, rinse the blackberries in a colander to wash away any dust or dirt. Put the blackberries in a non-stick saucepan and sprinkle over the caster sugar.
                    Stir in the lemon juice and heat gently for two minutes, or until the blackberries begin to soften and release their juices. Remove and reserve 12 blackberries for decoration and continue cooking the rest.
                    Simmer the blackberries very gently for 15 minutes, stirring regularly until very soft and squidgy. Remove from the heat and press the berries and juice through a sieve over a bowl, using the bottom of a ladle to help you extract as much of the purée as possible. Leave the purée to cool and discard the seeds. You should end up with around 325ml/11fl oz of purée.
                    Put the cream and yoghurt in a large bowl and whip with an electric whisk until soft peaks form when the whisk is removed from the bowl – the acidity of the fruit will thicken the cream further, so don't take it too far.
                    When the purée is completely cold, adjust the sweetness to taste by adding more sugar if needed. Pour it into the bowl with the whipped cream and yoghurt and stir just once or twice until very lightly combined.
                    Spoon the blackberry fool into individual wide, glass dishes – or one large, single bowl. It should look quite marbled, so don't over-stir it. Scatter a few tiny mint leaves on top and decorate with the reserved blackberries. Sprinkle with a little sugar if you like and serve with the hazelnut biscuits.
                    """,
                    ingredients: ["Sugar" : "1 oz", "Flour" : "1/2 of a cup"]
)
