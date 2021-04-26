# VERIFICATION de l'existence d'un dossier
def check_if_main_folder_exist(name)
    if Dir.exists?("#{name}")
        puts "Already existing folder!\nDo you want to remove it and recreate a new one ?\nEnter 'y' (yes) or 'n' (no).\n"
        print "> "
        answer = STDIN.gets.chomp.to_s.downcase
        delete_folder(name) if answer == 'y'
        abort("Program exit!") if answer != 'y'
    end
end

# VERIFICATION de la saisie
def check_if_user_gave_input
    abort("No text input! you must respect this form `ruby file_name.rb folder_name`.") if ARGV.empty?
end

# VERIFICATION du nombre d'entrées
def check_if_user_input_size
    abort("Wrong text input! you must enter just one word (folder name).") if ARGV.length > 1
end

# RECUPERATION du NOM du dossier à créer
def get_folder_name
    check_if_user_gave_input
    check_if_user_input_size
    return folder_name = ARGV.first
end

# SUPPRESSION d'un dossier
def delete_folder(name)
    system("rm -rf #{name}")
    puts "Folder deleted!"
end

# CREATION de dossiers
def create_folders(name)
    Dir.mkdir("#{name}")
    Dir.mkdir("#{name}/lib")
    puts "folders '#{name}' and 'lib' created!"
end

# CREATION de fichiers
def create_file_app(name)
    content = "require 'dotenv'\nrequire 'pry'\nrequire 'rspec'\nrequire 'rubocop'\n\nDotenv.load('../.env')\n\n#binding.pry\n\n"
    File.new "#{name}/app.rb","w"
    file = File.open("#{name}/app.rb", "w+")
    file.puts(content)
    file.close
    puts "file 'app.rb' created!"
end

def create_file_app_spec(name)
    File.new "#{name}/spec/app_spec.rb","w"
    file = File.open("#{name}/spec/app_spec.rb", "w+")
    file.puts("require_relative '../app.rb'\n\n")
    file.close
    puts "file 'app_spec.rb' created!"
end

def create_file_rubocop(name)
    path = File.dirname(__FILE__)
    content = File.read("#{path}/rubocop.txt")
    File.new "#{name}/.rubocop","w"
    file = File.open("#{name}/.rubocop", "w+")
    file.puts(content)
    file.close
    puts "file '.rubocop' created!"
end

def create_file_gemfile(name)
    ruby_v = RUBY_VERSION
    content = "source \"https://rubygems.org\"\nruby '#{RUBY_VERSION}'\n"
    content += "gem 'dotenv'\ngem 'pry'\ngem 'rspec'\ngem 'rubocop'\n"
    File.new "#{name}/Gemfile","w"
    file = File.open("#{name}/Gemfile", "w+")
    file.puts(content)
    file.close
    puts "file 'Gemfile' created!"
end

def create_file_readme(name)
    File.new "#{name}/README.md","w"
    file = File.open("#{name}/README.md", "w+")
    file.puts("# README\n\n")
    file.close
    puts "file 'README.md' created!"
end

def create_file_env(name)
    File.new "#{name}/.env","w"
    puts "file '.env' created!"
end

def create_file_gitignore(name)
    File.new "#{name}/.gitignore","w"
    file = File.open("#{name}/.gitignore", "w+")
    file.puts(".env\n")
    file.close
    puts ".gitignore created!"
end

# AJOUTS de gems
def add_other_gem(name)
    puts "Do want add a gem ?\nEnter 'y' (yes) or 'n' (no).\n"
    print "> "
    answer = STDIN.gets.chomp.to_s.downcase
    puts "\n" if answer != "y"
    return false if answer != "y"

    puts "Enter a new gem\n"
    print "> "
    gem = STDIN.gets.chomp.to_s.downcase
    return false unless gem

    content = "gem '#{gem}'\n\n"
    file = File.open("#{name}/Gemfile", "a+")
    file.puts(content)
    file.close
    puts "Gem '#{gem}' added!"

    add_other_gem(name)
end

# GENERATION de lignes de commandes
def generate_git_init(name)
    system("cd #{name} && git init")
    puts "'git init' launched!"
end

def generate_rspec_init(name)
    system("cd #{name} && rspec --init")
    puts "'rspec --init' launched!"
end

def generate_gemfile_lock(name)
    system("cd #{name} && bundle install")
    puts "'bundle install' launched!"
end


def perform
    name = get_folder_name
    check_if_main_folder_exist(name)
    create_folders(name)
    create_file_app(name)
    create_file_rubocop(name)
    create_file_gemfile(name)
    add_other_gem(name)
    create_file_readme(name)
    create_file_env(name)
    create_file_gitignore(name)
    generate_rspec_init(name)
    generate_gemfile_lock(name)
    create_file_app_spec(name)
    generate_git_init(name)
end

perform

# Création d'un ALIAS (en ligne de commandes)
# `$ nano ~/.bash_profile`
# ajouter : alias mkdiruby="ruby creation_dossier_ruby.rb"