const url = "http://localhost:8080/todo_list/webService";

class Network {
  static String getData() {
    return "$url/get_data.php";
  }

  static String tambahData() {
    return "$url/tambah_data.php";
  }

  static String updateData() {
    return "$url/ubah_data.php";
  }

  static String ubahHistory() {
    return "$url/ubah_history.php";
  }

  static String hapusData() {
    return "$url/hapus_data.php";
  }
}
