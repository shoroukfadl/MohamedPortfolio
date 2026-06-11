import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:portfolio/Features/home/domain/usecases/get_data_use_case.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

class PortfolioCubit extends HydratedCubit<PortfolioState> {
  final GetDataUseCase getDataUseCase;
  PortfolioCubit({required this.getDataUseCase}) : super(PortfolioState.init());

  Future<void> getData() async {
    debugPrint("GET DATTAAA");
    emit(state.copyWith(loading: RequestStatus.loading));
    final res = await getDataUseCase.call();
    res.fold((l) {
    debugPrint("GET DATTAAA iN FAILURE :: ${l.errorModel?.errorMessage}");
      emit(state.copyWith(loading: RequestStatus.error));
    }, (r) {
    debugPrint("GET DATTAAA IN SUCCESS  : ${r}"
        "" );
      emit(state.copyWith(loading: RequestStatus.success, data: r));
    });
  }

  @override
  PortfolioState? fromJson(Map<String, dynamic> json) {
    return PortfolioState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(PortfolioState state) {
    return state.toJson(state);
  }
}
