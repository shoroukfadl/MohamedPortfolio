import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/data/models/portfilio_model.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Utilities/Constants/enums.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final RequestStatus loading;
   int get projectLen => data?.projects.length??0;
   int get certificationLen => data?.certificates.length??0;


  const PortfolioState({this.data, this.loading = RequestStatus.init});

  factory PortfolioState.init() => const PortfolioState();

  PortfolioState copyWith({PortfolioEntity? data, RequestStatus? loading , }) =>
      PortfolioState(data: data ?? this.data, loading: loading ?? this.loading);

  @override
  List<Object?> get props => [data, loading];

  static PortfolioState fromJson(Map<String, dynamic> json) {
    try {
      final rawData = json['data'];
      return PortfolioState(
        data: rawData != null
            ? PortfolioModel.fromJson(rawData as Map<String, dynamic>).fromModel()
            : null,
        loading: RequestStatus.init,
      );
    } catch (e) {
      debugPrint("fromJson error: $e");
      return PortfolioState.init();
    }
  }
  Map<String, dynamic>  toJson(PortfolioState state)=> {
    'data':PortfolioModel.toModel(state.data).toFullJson()
  };
}
