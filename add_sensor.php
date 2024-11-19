<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestion_et_surveillance_stock";

// Connexion au serveur MySQL
$conn = mysql_connect($servername, $username, $password);

// Vérifier la connexion
if (!$conn) {
    die("Échec de la connexion au serveur MySQL : " . mysql_error());
}

// Sélectionner la base de données
if (!mysql_select_db($dbname, $conn)) {
    die("Impossible de sélectionner la base de données : " . mysql_error());
}

// Vérifier si le formulaire a été soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Récupérer les données du formulaire
    $sensorType = mysql_real_escape_string($_POST['sensor-type']);
    $sensorLocation = mysql_real_escape_string($_POST['sensor-location']);

    if (!empty($sensorType) && !empty($sensorLocation)) {
        // Préparer la requête d'insertion
        $sql = "INSERT INTO capteurs (type, emplacement) VALUES ('$sensorType', '$sensorLocation')";

        // Exécuter la requête
        if (mysql_query($sql, $conn)) {
            // Rediriger vers la page de gestion des capteurs
            header("Location: sensor-management.php");
            exit(); // IMPORTANT : Terminer le script après la redirection
        } else {
            echo "Erreur lors de l'ajout du capteur : " . mysql_error();
        }
    } else {
        echo "Tous les champs du formulaire doivent être remplis.";
    }
}

// Fermer la connexion
mysql_close($conn);
?>
