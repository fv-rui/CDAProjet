# Utilisation de l'image Ubuntu comme base
FROM ubuntu:20.04

# Définir les options non interactives pour éviter les invites pendant la configuration
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Mise à jour du système et installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-cli \
    libapache2-mod-php \
    php-pdo \
    php-mysql \
    php-gd \
    php-zip \
    php-mbstring \
    php-xml \
    php-dev \
    php-curl \
    curl \
    git \
    unzip \
    mysql-client \
    gnupg2 \
    tzdata \
    pkg-config \
    libssl-dev \
    php-mongodb \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Installer Composer globalement
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer et positionner dans le répertoire de l'application
WORKDIR /var/www/html

# Copier le code source de l'application dans le conteneur
COPY . /var/www/html

# Installer les dépendances Node.js et Bootstrap Icons
RUN npm install bootstrap-icons --save

# Copier les fichiers Bootstrap Icons dans le répertoire public
RUN mkdir -p /var/www/html/public/assets/icons && cp -r node_modules/bootstrap-icons/font /var/www/html/public/assets/icons

# Configurer les permissions pour le répertoire de l'application
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Activer le module Apache Rewrite
RUN a2enmod rewrite

# Configurer Apache pour autoriser l'utilisation des fichiers .htaccess
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Exposer le port 80 pour Apache
EXPOSE 80

# Démarrage d'Apache
CMD ["apachectl", "-D", "FOREGROUND"]
