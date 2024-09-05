# Projet CDA  
**Titre Professionnel : Concepteur Développeur d'Applications**

## Exécution du projet

### Prérequis
- Avoir Docker Desktop installé et en cours d'exécution.

### Étapes d'exécution

1. **Création du conteneur**

   Exécutez la commande suivante dans un terminal, depuis la racine du projet :
   ```bash
   docker-compose build
   ```
2. **Démarrage du conteneur**

   Ensuite, démarrez le conteneur avec la commande :
   ```bash
   docker-compose up
   ```
3. **Accès au projet dans le conteneur**

   Pour accéder au projet à l'intérieur du conteneur, entrez dans le conteneur avec la commande suivante :
   ```bash
   docker exec -it php_apache /bin/bash
   ```
   

   