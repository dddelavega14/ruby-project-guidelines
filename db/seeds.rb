User.destroy_all
Plant.destroy_all
PlantMarriage.destroy_all


david = User.create(email_address: "David@email.com", username: "Itchy", password: "password")
brian = User.create(email_address: "Brian@email.com", username: "Scratchy", password: "password")



plants = [
    {
        name: "Chrysanthemum",
        type_of_plant: "Blooming Plant",
        size: "Small",
        caring_instructions: "Keep soil evenly moist, watering up to twice a week. Full bright light",
        alive: true
    },
    {
        name: "Hoya Heart",
        type_of_plant: "Succulent",
        size: "Small",
        caring_instructions: "Allow plants to dry before watering. Keep in bright artificial light indoors or near a window without direct sun",
        alive: true
    },
    {

        name: "Juniper Bonsai",
        type_of_plant: "Tree",
        size: "Small",
        caring_instructions: "Water only when soil is dry. Keep humidity tray full. Prefers bright sunlight",
        alive: true
    }, 
    {

        name: "Meyer Lemon Tree",
        type_of_plant: "Tree",
        size: "Medium",
        caring_instructions: "Once a week, keep soil moist, but not wet. 8-12 hours of bright light per day",
        alive: true
    }, 
    {
        name: "Majesty Palm",
        type_of_plant: "Floor Plant",
        size: "Large",
        caring_instructions: "Once a week, when top 2-3 inches of soil is dry. Bright, indirect sunlight",
        alive: true
    }, 
    {

        name: "Dieffenbachia",
        type_of_plant: "Floor Plant",
        size: "Large",
        caring_instructions: "Once a week, when top soil is dry. Bright, indirect light. Will tolerate low light as well",
        alive: true
    }, 
    {

        name: "Monstera Deliciosa",
        type_of_plant: "Floor Plant",
        size: "Large",
        caring_instructions: "Water it enough to keep the soil from drying out completely - but it is semi drought tolerant!, Grows faster in a bright, indirect sunlight spot but also tolerates low light",
        alive: true
    }, 
    {

        name: "Sansevieria",
        type_of_plant: "Floor Plant",
        size: "Large",
        caring_instructions: "Every 2 weeks, or when soil is dry to the touch. 6-8 hours of sunlight",
        alive: true
    }, 
    {

        name: "Red Anthurium Plant",
        type_of_plant: "House Plant",
        size: "Medium",
        caring_instructions: "Place 6 ice cubes on top of soil or half a cup of water per week. Medium to bright light will encourage max blooms",
        alive: true
    }, 
    {

        name: "Golden Gate Ficus Bonsai",
        type_of_plant: "Tree",
        size: "Medium",
        caring_instructions: "Wet soil thoroughly every 2 or 3 days. Base tray not only catches excess water but provides the humidity your bonsai craves. Place near a window for some bright sunlight every day.",
        alive: true
    }, 
]

Plant.create(plants)

chrysanthemum = Plant.first
hoya_heart = Plant.second
juniper_bonsai = Plant.third
meyer_lemon = Plant.fourth
majesty_palm = Plant.fifth

PlantMarriage.create(user: david, plant: juniper_bonsai, helpful_hints: " ")
PlantMarriage.create(user: david, plant: hoya_heart, helpful_hints: " ")
PlantMarriage.create(user: brian, plant: meyer_lemon, helpful_hints: " ")
PlantMarriage.create(user: brian, plant: majesty_palm, helpful_hints: " ")