# Utiliser l'image officielle PHP avec Apache
FROM php:8.0-apache

# Installer les extensions PHP nécessaires et les dépendances
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    a2enmod rewrite

# Installer Node.js et npm
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installer PHPUnit via Composer
RUN composer global require phpunit/phpunit

# Ajouter le répertoire des binaires de Composer au PATH
ENV PATH="$PATH:/root/.composer/vendor/bin"

# Copier le code source de l'application dans le répertoire de l'image Docker
COPY . /var/www/html

# Définir le répertoire de travail
WORKDIR /var/www/html

# Installer les dépendances npm (comme Bootstrap)
RUN npm install

# Exposer le port 80 pour Apache
EXPOSE 80

# Commande de démarrage du conteneur
CMD ["apache2-foreground"]
