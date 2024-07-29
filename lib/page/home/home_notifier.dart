import 'package:flutter/material.dart';
import 'package:todolist/models/data_model.dart';
import 'package:todolist/repository/auth_repository.dart';
import 'package:todolist/network/network.dart';
import 'package:todolist/models/index.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getData();
  }

  List<DataModel> list = [];

  Future getData() async {
    list.clear(); //bersihin
    notifyListeners(); //mengunci program notifier

    AuthRepository.getData(Network.getData()).then((value) {
      if (value['value'] == 1) {
        for (Map<String, dynamic> i in value['data']) {
          list.add(DataModel.fromJson(i));
        }

        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  //tambah Data
  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  simpan() async {
    AuthRepository.tambahData(
            Network.tambahData(), nama.text.trim(), deskripsi.text.trim())
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    });
  }

  //ubahHistory

  ubahHistory(DataModel model) async {
    AuthRepository.ubahDataHistory(Network.ubahHistory(), model.id)
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    });
  }
}
