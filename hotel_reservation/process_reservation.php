<?php
$servername = "localhost";
$username = "root";  // Sesuaikan dengan username MySQL Anda
$password = "";  // Sesuaikan dengan password MySQL Anda
$dbname = "hotel_reservation";  // Nama database

// Buat koneksi ke database
$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Tangkap data dari form
$name = htmlspecialchars($_POST['name']);
$gender = $_POST['gender'];
$id_number = htmlspecialchars($_POST['id_number']);
$room_type = $_POST['room_type'];
$price = $_POST['price'];
$booking_date = $_POST['booking_date'];
$duration = $_POST['duration'];
$breakfast = isset($_POST['breakfast']) ? 1 : 0;
$total_payment = $_POST['total_payment'];

// SQL untuk memasukkan data ke tabel
$sql = "INSERT INTO reservations (name, gender, id_number, room_type, price, booking_date, duration, breakfast, total_payment)
VALUES ('$name', '$gender', '$id_number', '$room_type', '$price', '$booking_date', '$duration','$breakfast', '$total_payment')";

if ($conn->query($sql) === TRUE) {
    echo "<h2>Reservasi Berhasil!</h2>";
    echo "detail pesanan :";
    echo "<p> nama pemesan : $name  </p>";
    echo "<p> jenis kelamin : $gender  </p>";
    echo "<p> nomor identitas : $id_number  </p>";
    echo "<p> tipe kamar : $room_type  </p>";
    echo "<p> Herga : $price  </p>";
    echo "<p> lama menginap : $duration </p>";
    echo "<p> total pembayaran  : $total_payment  </p>";
    echo "<p>Terima kasih, <strong>$name</strong>, atas reservasi Anda.</p>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grafik Reservasi Hotel</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Grafik Pendapatan Berdasarkan Tipe Kamar</h1>
    <canvas id="reservasiChart" width="400" height="200"></canvas>

    <?php
    include 'db.php';

    $stmt = $pdo->query("SELECT room_type, SUM(total_payment) as total FROM reservations GROUP BY room_type");
    $room_types = [];
    $totals = [];

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $room_types[] = $row['room_type'];
        $totals[] = $row['total'];
    }

    $room_types_json = json_encode($room_types);
    $totals_json = json_encode($totals);
    ?>

    <script>
        const ctx = document.getElementById('reservasiChart').getContext('2d');
        const roomTypes = <?php echo $room_types_json; ?>;
        const totals = <?php echo $totals_json; ?>;

        const reservasiChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: roomTypes,
                datasets: [{
                    label: 'Total Pendapatan',
                    data: totals,
                    backgroundColor: [
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgba(75, 192, 192, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>