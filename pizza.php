<?php
session_start();

if (!isset($_SESSION['last_order_time'])) {
    $_SESSION['last_order_time'] = array();
}

$nev = $email = $telefon = $pizza = $meret = $extraSajt = $customerId = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nev = $_POST['nev'];
    $email = $_POST['email'];
    $telefon = $_POST['telefon'];
    $pizza = $_POST['pizza'];
    $meret = $_POST['meret'];
    $extraSajt = isset($_POST['extraSajt']) ? 1 : 0;

    $currentTime = time();

    if (isset($_SESSION['last_order_time'][$email]) && $currentTime - $_SESSION['last_order_time'][$email] < 60) {
        // Hogy ha ua az az emailt használták, várni kell 60mp az újabb rendeléshez
        echo "<!DOCTYPE html>
        <html lang=\"en\">
        <head>
            <meta charset=\"UTF-8\" />
            <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
            <link rel=\"stylesheet\" type=\"text/css\" href=\"pizza.css\" />
            <title>Success</title>
        </head>
        <body>
        <div class=\"container\">
            <h1>Pizza</h1>
            <form class=\"success-message\">
                <div class=\"form\">
                    <p class='error-text'>A következő rendeléséhez 60 másodpercnek el kell telnie.</p>
                </div>
            </form>
        </div>
        </body>
        </html>";
    } else {
        $conn = new mysqli('localhost', 'root', '', 'pizza');
        if ($conn->connect_error) {
            die('Connection Failed: ' . $conn->connect_error);
        } else {
            $stmt = $conn->prepare("INSERT INTO pizza (nev, email, telefon, pizza, meret, extraSajt, ido) VALUES (?, ?, ?, ?, ?, ?, NOW())");
            $stmt->bind_param("sssssi", $nev, $email, $telefon, $pizza, $meret, $extraSajt);

            if ($stmt->execute()) {
                $customerId = $stmt->insert_id;
                $stmt->close();
                $conn->close();

                $_SESSION['last_order_time'][$email] = $currentTime;
            
        // Sikeres kitöltés esetén + azonosító kód
                echo "<!DOCTYPE html>
        <html lang=\"en\">
        <head>
            <meta charset=\"UTF-8\" />
            <meta http-equiv=\"X-UA-Compatible\" content=\"IE-edge\" />
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
            <link rel=\"stylesheet\" type=\"text/css\" href=\"pizza.css\" />
            <title>Success</title>
        </head>
        <body>
        <div class=\"container\">
            <h1>Pizza</h1>
            <form class=\"success-message\">
                <div class=\"form\">
                    <p class='success-text'>A rendelés sikeresen elküldve</p>
                    <p class='customer-id'>Azonosító: $customerId</p>
                </div>
            </form>
        </div>
        </body>
        </html>";
            } else {
                
      // Sikertelen kitöltés esetén + hiba
                echo "<!DOCTYPE html>
        <html lang=\"en\">
        <head>
            <meta charset=\"UTF-8\" />
            <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
            <link rel=\"stylesheet\" type=\"text/css\" href=\"pizza.css\" />
            <title>Error</title>
        </head>
        <body>
        <div class=\"container\">
            <h1>Pizza</h1>
            <form class=\"error-message\">
                <div class=\"form\">
                    <p class='error-text'>Hiba történt a rendelés során: " . $stmt->error . "</p>
                </div>
            </form>
        </div>
        </body>
        </html>";
            }
        }
    }
}
?>
