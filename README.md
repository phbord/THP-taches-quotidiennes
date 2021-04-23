# README

## 1. Recoder "mkdir" en Ruby
- saisie d'un mot au lancement            => un dossier va être créer (là où il se trouve)
- saisie de plusieurs mots                => uniquement le 1er dossier demandé sera créer
- pas de saisie de suite de caractères    => message d'erreurs


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
- créer un alias
  - alias search="ruby /home/ton/chemin/vers/google_searcher.rb"
  - saisir : $ search how to center a div


## 3. Création d'un dossier ruby
créer une commande mkdiruby
- Création d'un dossier qui porte le nom de l'ARGV de l'utilisateur
  - Si l'utilisateur ne rentre pas de ARGV ou ne rentre un ARGV avec plusieurs mots => dire à l'utilisateur comment s'en servir et s'arrêter
  - dossiers lib
  - Création du Gemfile avec les gems de THP
  - Git init
  - Création du fichier .env, puis on le met dans le fichier .gitignore
  - Création du dossier lib
  - rspec --init
  - Création d'un Readme.md (qui va dire que c'est un programme Ruby)
  - Création d'un alias de "mkdiruby"