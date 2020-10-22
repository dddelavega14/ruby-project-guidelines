require 'pry'
class CLI


    def logo
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Welcome to Plant Mom").colorize(:green)
    
        greeting
    end

    def greeting
        prompt = TTY::Prompt.new
        welcome = prompt.select("What would you like to do?") do |menu|
            menu.choice 'Log in'
            menu.choice 'Sign up'
            menu.choice 'Exit'
        end
        if welcome == 'Log in'
            log_in
        elsif welcome == 'Sign up'
            sign_up
        else 
            puts "Farewell for now"
        end
    end
    
   

def log_in
        puts "Please enter your Username"
        username = gets.chomp
        if User.exists?(username: username)
            puts "Please enter your Password"
            password = gets.chomp
            if User.exists?(password: password)
                puts "Welcome, #{username}"
                @this_user = User.find_by(username: username)
                system("clear")
                main_menu
            else 
                puts "Sorry, incorrect password"
                log_in
            end
        else
            puts "Sorry, username does not exist"
            greeting
        end
    end
    
    

    


    def sign_up
        puts "Please enter an email address"
        email_address = gets.chomp
        if User.exists?(email_address: email_address)
            puts "Sorry, that email address is already being used"
            sign_up
        else
            puts "Please create a Username"
            username = gets.chomp
            if User.exists?(username: username)
                puts "Sorry that username is already being used."
                sign_up
            else 
                puts "Please create Password"
                password = gets.chomp
                @this_user = User.create(email_address: email_address, username: username, password: password)
                puts "Thank you for joining Plant Mom, #{username}"
            end
            system("clear")
            main_menu
        end
    end

    

    def main_menu
        prompt = TTY::Prompt.new 
        choose = prompt.select("Here are some options") do |menu| 
        menu.choice "My Plants"
        menu.choice "Available Plants"
        end
        if choose == "My Plants"
            my_plants 
        elsif choose == "Available Plants"
            available_plants
        else
            puts "Invalid Entry".colorize(:red)
        end
    end



    def my_plants
        PlantMarriage.all.each do |p_marry|
            if p_marry.user_id == @this_user.id
                x = p_marry.plant_id
                y = p_marry.helpful_hints
                @plant = Plant.all.find(x)
                puts "#{@plant.name}, your helpful hint is #{y}"
            end
        end
        puts "How will you like to manage your plants today"
        puts "Enter 1 if you would like to share your helpful hints"
        puts "Enter 2 if you have any plant deaths to declare 😔"
        choice = gets.chomp
        case choice
            when "1"
                add_hint
            when "2"
                plant_death
            else
                puts "Invalid Entry".colorize(:red)
                my_plants
            end
    end

        # def available_plants 
        #     prompt = TTY::Prompt.new 
        #     @@input = prompt.select("What plants would you like to add?", [
        #         'Chrysanthemum',
        #         'Hoya Heart',
        #         'Juniper Bonsai',
        #         'Meyers Lemon Tree',
        #         'Majesty Palm',
        #         'Dieffenbachia',
        #         'Monstera Deliciosa',
        #         'Sansevieria',
        #         'Red Anthurium Plant',
        #         'Golden Gate Ficus Bonsai'
        #         ])
        # end

        # def self.available_plants_choice 
        #     case @@input 
        #     when 'Chrysanthemum'

        # end

    # def available_plants 
    #    prompt = TTY::Prompt.new
    #    choice = prompt.select("What plants would you like to add?") do |menu|
    #        menu.choice 'Chrysanthemum'
    #        menu.choice 'Hoya Heart'
    #        menu.choice 'Juniper Bonsai'
    #        menu.choice 'Meyers Lemon Tree'
    #        menu.choice 'Majesty Palm'
    #        menu.choice 'Dieffenbachia'
    #        menu.choice 'Monstera Deliciosa'
    #        menu.choice 'Sansevieria'
    #        menu.choice 'Red Anthurium Plant'
    #        menu.choice 'Golden Gate Ficus Bonsai'
    #    end
    
    #     if choice == 'Chrysanthemum'
    #          add_plant ('Chrysanthemum')
    #     if choice == 'Hoya Heart'
    #          add_plant ('Hoya Heart')
    #     if choice == 'Juniper Bonsai' 
    #          add_plant ('Juniper Bonsai')  
    #     if choice == 'Meyers Lemon Tree'
    #          add_plant ('Meyers Lemon Tree')
    #     if choice == 'Majesty Palm'
    #          add_plant ('Majesty Palm')
    #     if choice == 'Dieffenbachia'
    #          add_plant ('Dieffenbachia')
    #     if choice == 'Monstera Deliciosa'
    #          add_plant ('Monstera Deliciosa')
    #     if choice =='Sansevieria'
    #          add_plant ('Sansevieria')
    #     if choice == 'Red Anthurium Plant'
    #          add_plant ('Red Anthurium Plant')
    #     if choice == 'Golden Gate Ficus Bonsai'
    #          add_plant ('Golden Gate Ficus Bonsai')
    #    end

    

    def add_hint
        puts "What Plant would you like to add a hint to?"
        plant_name = gets.chomp
        plant = Plant.find_by(name: plant_name)
        user_plant = PlantMarriage.find_by(user_id: @this_user)
        if !user_plant
            puts "I'm sorry, you dont own this plant".colorize(:red)
            puts "Would you like to try again?"
            puts "Press 1 to try again"
            puts "Press 2 to return to the main menu"
            choice = gets.chomp
            case choice
            when "1"
                add_hint
            when "2"
                main_menu
            else 
                puts "Invalid Entry".colorize(:red)
                main_menu
            end
        else
            puts "What is your helpful hint?"
            user_hint = gets.chomp
            user_plant.update(helpful_hints: user_hint)
            puts "Thank you for your hint!".colorize(:green)
            puts "Would you like to add another comment?"
            puts "Press 1 if yes"
            puts "Press 2 to return to main menu"
            choice_2 = gets.chomp 
            case choice
            when "1"
                add_hint
            when "2"
                main_menu
            else 
                puts "Invalid Entry".colorize(:red)
                main_menu
            end
        end



    end

    def plant_death
        puts "I'm sorry to hear that 😔. Which plant died?"
        remove = gets.chomp
        change_status = Plant.where(name: remove).ids
        remove_plant = PlantMarriage.find_by(user: @this_user, plant: change_status)
        PlantMarriage.destroy(remove_plant.id)
        puts "#{remove} has been declared dead 😢. Your list of plants has been updated"
        my_plants
    end
        
            





end #CLI