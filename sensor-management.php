<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gestion_et_surveillance_stock";

// Créer la connexion avec MySQL
$conn = mysql_connect($servername, $username, $password);

// Vérifier la connexion
if (!$conn) {
    die("Échec de la connexion : " . mysql_error());
}

// Sélectionner la base de données
mysql_select_db($dbname, $conn);

// Récupérer la liste des capteurs
$sql = "SELECT * FROM capteurs";
$result = mysql_query($sql);

// Initialiser le tableau des capteurs
$capteurs = [];

// Vérifier si des capteurs ont été trouvés
if ($result && mysql_num_rows($result) > 0) {
    while ($row = mysql_fetch_assoc($result)) {
        $capteurs[] = $row;  // Ajoute chaque capteur au tableau
    }
}

// Fermer la connexion à la base de données
mysql_close($conn);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Capteurs IoT</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Gestion des Capteurs IoT</h1>
        <nav>
            <ul>
                <li><a href="index.html">Tableau de bord</a></li>
                <li><a href="add-sensor.html">Ajouter un Capteur</a></li>
                <li><a href="sensor-list.php">Liste des Capteurs</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="sensor-list">
            <h2>Liste des Capteurs</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Emplacement</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Vérifier si des capteurs ont été trouvés
                    if (!empty($capteurs)) {
                        // Affichage des capteurs dans le tableau
                        foreach ($capteurs as $row) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['type']) . "</td>";
                            echo "<td>" . htmlspecialchars($row['emplacement']) . "</td>";
                            echo "<td>";
                            echo "<a href='edit-sensor.php?id=" . htmlspecialchars($row['id']) . "'>Modifier</a> | ";
                            echo "<a href='delete-sensor.php?id=" . htmlspecialchars($row['id']) . "'>Supprimer</a>";
                            echo "</td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='4'>Aucun capteur trouvé.</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>© 2024 Gestion des Capteurs IoT</p>
    </footer>
</body>
</html>
