# VERIFICATION de la saisie
def check_if_user_gave_input
    abort("mkdir: missing input") if ARGV.empty?
end

# RECUPERATION du NOM du dossier à créer
def get_folder_name
    return folder_name = ARGV.first
end

# CREATION du dossier (nom du dossier récupéré)
def create_folder(name)
    check_if_user_gave_input
    Dir.mkdir(name)
end

def perform
    name = get_folder_name
    create_folder(name)
end

perform

# saisir => ruby create_dir.rb mon_nom_de_dossier
# PETIT BONUS : si tu mets ce programme dans un dossier bien défini et que tu branches un alias du genre :
# alias mkdiruby="ruby /home/ton/chemin/vers/dossier/mkdiruby.rb"