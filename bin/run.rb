require_relative '../config/environment'

def greeting
    a = Artii::Base.new :font => 'slant'
    puts a.asciify("Welcome to Plant Mom").colorize(:green)
end
greeting

def sign_in_or_up
    prompt = TTY::Prompt.new
    prompt.multi_select("What would you like to do?") do |menu|
        menu.choice "Log in"
        menu.choice "Sign up"
    end
end
sign_in_or_up

def log_in
    puts "Please enter your Username"
    username = gets.chomp
    if User.exists?(username: username)
        puts "Please enter your Password"
        password = gets.chomp
        if User.exists?(password: password)
            puts "Welcome, #{username}"
            @this_user = User.find_by(username: username)
        else 
            puts "Sorry, incorrect password"
            log_in
        end
    else
        puts "Sorry, username does not exist"
        sign_in_or_up
    end
end
log_in

def sign_up
    puts "Please enter an email address"
    email_address = gets.chomp
    if User.exists?(email_address: email_address)
        puts "Sorry, that email address is already being used"
    else
        puts "Please create a Username"
        username = gets.chomp
        if User.exists?(username: username)
            puts "Sorry that username is already being used."
        else 
            puts "Please create Password"
            password = gets.chomp
            @this_user = User.create(email_address: email_address, username: username, password: password)
            puts "Thank you for joining Plant Mom, #{username}"
        end
    end
end
sign_up
