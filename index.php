<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
   <h1 class="text-center"> hello docker</h1>
   <i class="bi bi-arrow-up-square-fill"></i>
<br>
   <?php
require 'vendor/autoload.php'; // Inclure Composer autoload pour MongoDB

// Configuration de la connexion MongoDB
$mongoClient = new MongoDB\Client("mongodb://localhost:27017");  // Connexion à MongoDB

// Sélection de la base de données et de la collection
$db = $mongoClient->eduplanlink;   // Base de données 'eduplanlink'
$collection = $db->candidats;      // Collection 'candidats'

// Exemple d'insertion d'un document dans la collection
$insertResult = $collection->insertOne([
    'nom' => 'John Doe',
    'email' => 'johndoe@example.com',
    'age' => 30,
]);

echo "Document inséré avec l'ID : " . $insertResult->getInsertedId() . "\n";

// Exemple de requête pour récupérer tous les documents de la collection
$cursor = $collection->find();

echo "Documents présents dans la collection 'candidats':\n";
foreach ($cursor as $document) {
    echo $document['nom'] . " - " . $document['age'] . " => " . $document['email'] . "\n";
}

?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>