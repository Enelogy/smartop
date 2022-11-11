import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartop/models/m_produk.dart';
import 'package:smartop/shared/s_styles.dart';

import '../models/m_produk.dart';

class vdetailproduk extends StatefulWidget {
  final mproduk mProduk;
  const vdetailproduk({Key? key, required this.mProduk}) : super(key: key);

  @override
  State<vdetailproduk> createState() => _vdetailprodukState();
}

class _vdetailprodukState extends State<vdetailproduk> {
  int _selectedIndex = 0;
  final TextEditingController _jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rincian Produk"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Center(
                child: Image.network(
                  'https://smartop.minur.tech/image/produk/${widget.mProduk.gambar}',
                  fit: BoxFit.contain,
                  height: 250,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Deskripsi',style: TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      RowItemdua('Nama', widget.mProduk.nama),
                      RowItemdua('Harga Satuan', widget.mProduk.harga),
                      RowItemdua('Jumlah', widget.mProduk.jumlah),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Masukkan Ke Keranjang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded),
              label: 'Open Dialog',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {
            switch (index) {
              case 0:
                // only scroll to top when current index is selected.
                if (_selectedIndex == index) {
                  showModal(context, widget.mProduk.id, widget.mProduk.harga);
                }
                break;
              case 1:
                showModal(context, widget.mProduk.id, widget.mProduk.harga);
                break;
            }
            setState(
              () {
                _selectedIndex = index;
              },
            );
          }),
    );
  }
  void showModal(BuildContext context, int id, String harga) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content:
        Column(
          children: [
            Text('Masukkan Jumlah'),
            TextFormField(
                controller: _jumlah,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // for below version 2 use this
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
                  FilteringTextInputFormatter.digitsOnly

                ],
                decoration: InputDecoration(
                    hintText: "1-9",
                )
            )
          ],
        ) ,
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tutup'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Lanjutkan'),
          )
        ],
      ),
    );
  }
}
