import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;

import '../../Model/UserModel.dart';
part 'datacubit_state.dart';

class DatacubitCubit extends Cubit<DatacubitState> {
  DatacubitCubit() : super(DatacubitInitial());
  List<Users> userscubit = [];

  Future getdata() async {
    emit(Loadingstate());
    final url = Uri.parse('http://api.escuelajs.co/api/v1/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsondata = jsonDecode(response.body);
        List<Users> UsersList =
            jsondata.map((user) => Users.fromjson(user)).toList();
        userscubit = UsersList;
        emit(datafetchedstate());
        print('successsss');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
