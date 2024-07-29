import 'package:flutter/material.dart';
import 'package:todolist/page/home/home_notifier.dart';
import 'package:todolist/page/history/history_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HistoryPage()));
            },
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.history,
              color: Colors.white,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: 60,
                color: Colors.blue,
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Data To-Do-List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(22),
                child: Form(
                  key: value.keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: value.nama,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "DATA TIDAK BOLEH KOSONG!";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "NAMA KEGIATAN"),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: value.deskripsi,
                        maxLines: 3,
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "DATA TIDAK BOLEH KOSONG!";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(hintText: "Deskripsi"),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => value.cek(),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  "Simpan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () => value.getData(),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(22),
                      child: ListView.builder(
                        itemCount: value.list
                            .where((data) => data.status == "DIBUAT")
                            .length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = value.list
                              .where((data) => data.status == "DIBUAT")
                              .toList()[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: 5,
                                          color: Colors.grey[200] ??
                                              Colors.transparent)
                                    ]),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.nama}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${data.deskripsi}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        value.ubahHistory(data);
                                      },
                                      child: Text(
                                        "Selesai",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
