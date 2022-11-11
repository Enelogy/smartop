import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartop/controllers/c_produk.dart';
import 'package:smartop/models/m_produk.dart';
import 'package:smartop/views/v_detail_produk.dart';

import '../../shared/s_styles.dart';

class vwhome extends StatefulWidget {
  const vwhome({Key? key}) : super(key: key);

  @override
  State<vwhome> createState() => _vwhomeState();
}

class _vwhomeState extends State<vwhome> {
  bool _toggleButton = false;
  bool is_loading = true;

  late mproduk mProduk;
  late Future<List<mproduk>> futureData;

  @override
  initState() {
    super.initState();
    futureData = getProduk();
    // setId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: 
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 100,
              ),
            )),
            Row(),
            Card(
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Text('Produk Terkini', style: TextStyle(fontWeight: FontWeight.bold),),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: FutureBuilder<List<mproduk>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<mproduk>? data = snapshot.data;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: data!.length,
                              itemBuilder: (context, index) {
                                return _buildDataItem(data[index]);
                              });
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
  _buildDataItem(mproduk mproduk) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>vdetailproduk(mProduk: mproduk)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SizedBox(
          height: 125,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  child: (mproduk.gambar.isEmpty)
                      ? Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.contain,
                    width: 125,
                    height: 125,
                  )
                      : Image.network(
                    'https://smartop.minur.tech/image/produk/${mproduk.gambar}',
                    fit: BoxFit.contain,
                    width: 125,
                    height: 125,
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${mproduk.nama}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Durasi Paket
                        RowItem("Kategori", mproduk.kategori),
                        RowItem("Jumlah", mproduk.jumlah),
                        RowItem("Harga", mproduk.harga),
                        // RowItem("Pendapatan Harian", mtipeinvest.total),
                        // RowItem("Persentase ", mtipeinvest.lamapenarikan)
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

