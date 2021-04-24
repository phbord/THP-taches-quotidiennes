# README

## RACCOURCIS
- glaunch
- mkdiruby

## 1. Recoder "mkdir" (en Ruby)
- saisie d'un mot au lancement         => un dossier va être créer (là où il se trouve)
- saisie de plusieurs mots             => uniquement le 1er dossier demandé sera créer
- pas de saisie de suite de caractères => message d'erreurs


## 2. GoogleSearcher
Ouverture d'un onglet Google Chrome et lance une recherche automatique (par la saisie de l'utilisateur)
- Saisie d'un ARGV à l'exécution du programme
- Si rien n'ai saisi, le programme va lui dire comment ça marche
- L'ARGV correspond à ce que l'utilisateur veut rechercher sur Google
- Récupération de l'ARGV et construire une URL à partir de l'ARGV
- Ouverture d'un nouvel onglet à partir de cette recherche

### Etapes
- la recherche "How to center a div" sera : https://www.google.com/search?q=how+to+center+a+div
- utiliser la gem Launchy
- créer un alias permanent
  - alias search="ruby /home/ton/chemin/vers/google_searcher.rb"
  - saisir : $ search how to center a div


## 3. Création d'un dossier ruby
- création d'une commande `mkdiruby`
- création d'un dossier récupérant le nom de l'ARGV
  - si aucun ARGV ou un ARGV de plusieurs mots
    - => dire à l'utilisateur comment s'en servir et s'arrêter
  - dossiers __lib__
  - création du fichier __Gemfile__ (gems de THP)
  - `git init`
  - création du fichier __.env__, puis on le met dans le fichier __.gitignore__
  - création du dossier __lib__
  - `rspec --init`
  - création d'un __README.md__ (qui va dire que c'est un programme Ruby)
  - création d'un __alias__ `mkdiruby` permanent