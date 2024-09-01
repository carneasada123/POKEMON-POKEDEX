<?php
// Archivo: index.php

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "pokemon_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Función para obtener un Pokémon aleatorio
function getRandomPokemon() {
    $pokemonId = rand(1, 151); // Limitar a los primeros 151 Pokémon
    $apiUrl = "https://pokeapi.co/api/v2/pokemon/" . $pokemonId;

    $pokemonData = file_get_contents($apiUrl);
    return json_decode($pokemonData, true);
}

// Función para guardar los datos del Pokémon en la base de datos
function savePokemon($conn, $pokemon) {
    $name = $conn->real_escape_string($pokemon['name']);
    $image_url = $conn->real_escape_string($pokemon['sprites']['front_default']);
    $type = $conn->real_escape_string($pokemon['types'][0]['type']['name']);

    // Mapear las habilidades para obtener sus nombres
    $abilities = array_map(function($ability) {
        return ['name' => $ability['ability']['name']];
    }, $pokemon['abilities']);

    $abilities_json = $conn->real_escape_string(json_encode($abilities));

    $sql = "INSERT INTO pokemons (pokemon_id, name, image_url, type, abilities)
            VALUES ('{$pokemon['id']}', '$name', '$image_url', '$type', '$abilities_json')";

    if ($conn->query($sql) === TRUE) {
        echo "Pokémon guardado con éxito.";
    } else {
        echo "Error al guardar el Pokémon: " . $conn->error;
    }
}

// Si se solicita un Pokémon aleatorio
if (isset($_GET['random'])) {
    $pokemon = getRandomPokemon();
    savePokemon($conn, $pokemon);
}

// Función para obtener todos los Pokémon almacenados en la base de datos
function getAllPokemons($conn) {
    $sql = "SELECT * FROM pokemons ORDER BY created_at DESC";
    $result = $conn->query($sql);
    return $result;
}

$pokemons = getAllPokemons($conn);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokémon Aleatorio</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Pokémon Aleatorio</h1>
    <?php if (isset($pokemon)): ?>
        <h2><?php echo ucfirst($pokemon['name']); ?></h2>
        <img src="<?php echo $pokemon['sprites']['front_default']; ?>" alt="<?php echo $pokemon['name']; ?>">
        <p>Tipo: <?php echo ucfirst($pokemon['types'][0]['type']['name']); ?></p>
        <p>Habilidades: 
            <?php 
            $abilities = array_map(function($ability) {
                return $ability['ability']['name'];
            }, $pokemon['abilities']);
            echo implode(', ', $abilities);
            ?>
        </p>
    <?php endif; ?>
    <form method="get">
        <button type="submit" name="random">Obtener Pokémon Aleatorio</button>
    </form>

    <h2>Pokémones Guardados</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Imagen</th>
                <th>Tipo</th>
                <th>Habilidades</th>
                <th>Fecha de Creación</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($pokemons->num_rows > 0): ?>
                <?php while($row = $pokemons->fetch_assoc()): ?>
                    <tr>
                        <td><?php echo $row['pokemon_id']; ?></td>
                        <td><?php echo ucfirst($row['name']); ?></td>
                        <td><img src="<?php echo $row['image_url']; ?>" alt="<?php echo $row['name']; ?>" width="50"></td>
                        <td><?php echo ucfirst($row['type']); ?></td>
                        <td>
                            <?php 
                            $abilities = json_decode($row['abilities'], true);
                            $abilityNames = array_map(function($ability) {
                                return $ability['name'];
                            }, $abilities);
                            echo implode(', ', $abilityNames);
                            ?>
                        </td>
                        <td><?php echo $row['created_at']; ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr>
                    <td colspan="6">No se han guardado Pokémones.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
$conn->close();
?>
