import 'package:flutter/material.dart';
import 'package:todolist/models/data_model.dart';
import 'package:todolist/network/network.dart';
import 'package:todolist/repository/auth_repository.dart';

class HistoryNotifier extends ChangeNotifier {
  final BuildContext context;

  HistoryNotifier({required this.context}) {
    getData();
  }

  List<DataModel> list = [];
  Future getData() async {
    list.clear();
    notifyListeners();

    AuthRepository.getData(Network.getData()).then((value) {
      if (value['value'] == 1) {
        for (Map<String, dynamic> i in value['data']) {
          if (i['status'] != "DIBUAT") {
            list.add(DataModel.fromJson(i));
          }
        }

        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  // hapus data
  hapusData(DataModel model) async {
    AuthRepository.hapusData(Network.hapusData(), model.id).then((value) {
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
