import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../model/city_response.dart';
import '../model/district_response.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityState());

  Future getListCity() async {
    final json = await http
        .get(Uri.parse("https://apiv3.thegioisim.com/api/area/cities"));
    CityResponse response = CityResponse.fromJson(jsonDecode(json.body));
    if (response.code == 0) {
      emit(state.copyWith(
        listCity: response.data,
        listCityOriginal: response.data,
      ));
    }
  }

  Future getListDistrict(String idCity) async {
    final json = await http.get(Uri.parse(
        "https://apiv3.thegioisim.com/api/area/districts?cityId=$idCity"));
    DistrictResponse response =
        DistrictResponse.fromJson(jsonDecode(json.body));
    if (response.code == 0) {
      emit(state.copyWith(
        listDistrict: response.data,
        listDistrictOriginal: response.data,
      ));
    }
  }

  void onClickCity(DataCity? data) {
    if (data?.id == null) return;
    state.copyWith(selectedCity: data);
    getListDistrict(data?.id ?? "");
  }

  search(String value, bool isCity) {
    if (isCity) {
      var text = removeDiacritics(value).toLowerCase();
      List<DataCity>? searchedData = state.listCityOriginal?.where((element) {
        String title = element.name ?? "";
        if (title == null) return false;
        return removeDiacritics(title).toLowerCase().contains(text);
      }).toList();
      emit(state.copyWith(listCity: searchedData));
    } else {
      var text = removeDiacritics(value).toLowerCase();
      List<DataDistrict>? searchedData =
          state.listDistrictOriginal?.where((element) {
        String title = element.name ?? "";
        if (title == null) return false;
        return removeDiacritics(title).toLowerCase().contains(text);
      }).toList();
      emit(state.copyWith(listDistrict: searchedData));
    }
  }
}

class CityState {
  final List<DataCity>? listCityOriginal;
  final List<DataDistrict>? listDistrictOriginal;
  final List<DataCity>? listCity;
  final List<DataDistrict>? listDistrict;
  final DataCity? selectedCity;

  CityState({
    this.listCity,
    this.selectedCity,
    this.listDistrict,
    this.listCityOriginal,
    this.listDistrictOriginal,
  });

  CityState copyWith({
    List<DataCity>? listCityOriginal,
    List<DataDistrict>? listDistrict,
    List<DataCity>? listCity,
    List<DataDistrict>? listDistrictOriginal,
    DataCity? selectedCity,
  }) {
    return CityState(
      listCityOriginal: listCityOriginal ?? this.listCityOriginal,
      listCity: listCity ?? this.listCity,
      listDistrict: listDistrict ?? this.listDistrict,
      listDistrictOriginal: listDistrictOriginal ?? this.listDistrictOriginal,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}
