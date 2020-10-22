require 'pry'
class CLI

    def logo
        a = Artii::Base.new :font => 'slant'
        puts a.asciify("Welcome to Plant Mom").colorize(:green)
    
        greeting
    end
    
    def greeting
        puts "What would you like to do?"
        puts "Please Enter 1 to Log in, or 2 to Sign up"
        choice = gets.chomp
        case choice
            when "1"
                log_in
            when "2"
                sign_up
            else
                puts "Invalid Entry".colorize(:red)
                greeting
            end
            binding.pry 
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
        end
    end

    def main_menu
        puts "Here are some options"
        puts "Enter 1 to see your plants"
        puts "Enter 2 to view available plants"
        choice = gets.chomp
        case choice
            when "1"
                my_plants
            when "2"
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
    





end #CLI