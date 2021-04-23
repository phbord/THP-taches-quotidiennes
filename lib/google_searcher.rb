require 'launchy'

# VERIFICATION de la saisie
def check_if_user_gave_input
    abort("mkdir: missing input") if ARGV.empty?
end

# RECUPERATION du NOM du dossier à créer
def get_folder_name
    folder_name = ARGV.each { |n| n }
    return folder_name
end

# CREATION du dossier (nom du dossier récupéré)
def create_url(name)
    check_if_user_gave_input
    req = ""
    name.each.with_index { |v,k| k == 0 ? req += "#{v}" : req += "+#{v}" }
    url = "https://www.google.com/search?q=#{req}"
    return url
end

# OUVERTURE du navigateur avec la recherche
def open_browser_with_search(url)
    Launchy.open(url)
end

def perform
    name = get_folder_name
    url = create_url(name)
    open_browser_with_search(url)
end

perform