import 'dart:convert';

class mproduk{
  final int id;
  final String kode;
  final String merek;
  final String nama;
  final String jenis;
  final String satuan;
  final String jumlah;
  final String harga;
  final String gambar;
  final String created_at;
  final String updated_at;
  final String kategori;

  mproduk({
    required this.id,
    required this.kode,
    required this.merek,
    required this.nama,
    required this.jenis,
    required this.satuan,
    required this.jumlah,
    required this.harga,
    required this.gambar,
    required this.created_at,
    required this.updated_at,
    required this.kategori,
  });

  factory mproduk.fromJson(Map<String, dynamic> json) {
    return mproduk(
      id: json['id'],
      kode: json['kode'],
      merek: json['merek'],
      nama: json['nama'],
      jenis: json['jenis'],
      satuan: json['satuan'],
      jumlah: json['jumlah'],
      harga: json['harga'],
      gambar: json['gambar'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      kategori: json['kategori'],
    );
  }
}