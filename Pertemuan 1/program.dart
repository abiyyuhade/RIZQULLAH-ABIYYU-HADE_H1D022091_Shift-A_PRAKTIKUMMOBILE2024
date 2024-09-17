import 'dart:io';

void main() {
  print("Konversi Suhu");

  print("Pilih Jenis Konversi");
  print("1. Celcius ke Fahrenheit");
  print("2. Fahrenheit ke Celcius");
  print("3. Celcius ke Kelvin");
  print("4. Kelvin ke Celcius");
  print("5. Fahrenheit ke Kelvin");
  print("6. Kelvin ke Fahrenheit");

  int pilihan = int.parse(stdin.readLineSync()!);

  print("Masukan Suhu:");
  double suhu = double.parse(stdin.readLineSync()!);

  double hasil;

  switch(pilihan) {
    case 1:
      hasil = (suhu * 9/5) + 32;
      print("$suhu°C sama dengan $hasil°F");
      break;
    case 2:
      hasil = (suhu - 32) * 5/9;
      print("$suhu°F sama dengan $hasil°C");
      break;
    case 3:
      hasil = suhu + 273.15;
      print("$suhu°C sama dengan $hasil K");
      break;
    case 4:
      hasil = suhu - 273.15;
      print("$suhu K sama dengan $hasil°C");
      break;
    case 5:
      hasil = (suhu - 32) * 5/9 + 273.15;
      print("$suhu°F sama dengan $hasil K");
      break;
    case 6:
      hasil = (suhu - 273.15) * 9/5 + 32;
      print("$suhu K sama dengan $hasil°F");
      break;
    default:
      print("Pilihan tidak valid");
  }
}