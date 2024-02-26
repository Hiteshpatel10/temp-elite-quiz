import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterquiz/features/profileManagement/profileManagementRepository.dart';

@immutable
abstract class UpdateScoreAndCoinsState {}

class UpdateScoreAndCoinsInitial extends UpdateScoreAndCoinsState {}

class UpdateScoreAndCoinsInProgress extends UpdateScoreAndCoinsState {}

class UpdateScoreAndCoinsSuccess extends UpdateScoreAndCoinsState {
  UpdateScoreAndCoinsSuccess({this.coins, this.score});

  final String? score;
  final String? coins;
}

class UpdateScoreAndCoinsFailure extends UpdateScoreAndCoinsState {
  UpdateScoreAndCoinsFailure(this.errorMessage);

  final String errorMessage;
}

class UpdateScoreAndCoinsCubit extends Cubit<UpdateScoreAndCoinsState> {
  UpdateScoreAndCoinsCubit(this._profileManagementRepository)
      : super(UpdateScoreAndCoinsInitial());
  final ProfileManagementRepository _profileManagementRepository;

  Future<void> updateCoins({
    required String title,
    required bool addCoin,
    String? userId,
    int? coins,
    String? type,
  }) async {
    emit(UpdateScoreAndCoinsInProgress());

    await _profileManagementRepository
        .updateCoins(
      userId: userId!,
      coins: coins,
      addCoin: addCoin,
      type: type,
      title: title,
    )
        .then((result) {
      if (!isClosed) {
        emit(
          UpdateScoreAndCoinsSuccess(
            coins: result.coins,
            score: result.score,
          ),
        );
      }
    }).catchError((Object e) {
      if (!isClosed) {
        emit(UpdateScoreAndCoinsFailure(e.toString()));
      }
    });
  }

  Future<void> updateScore(String? userId, int? score, {String? type}) async {
    emit(UpdateScoreAndCoinsInProgress());
    await _profileManagementRepository
        .updateScore(userId: userId!, score: score, type: type)
        .then(
          (result) => emit(
            UpdateScoreAndCoinsSuccess(
              coins: result['coins'] as String,
              score: result['score'] as String,
            ),
          ),
        )
        .catchError((Object e) {
      emit(UpdateScoreAndCoinsFailure(e.toString()));
    });
  }

  Future<void> updateCoinsAndScore(
    String? userId,
    int? score,
    int coins,
    String title, {
    bool addCoin = true,
    String? type,
  }) async {
    emit(UpdateScoreAndCoinsInProgress());

    await _profileManagementRepository
        .updateCoinsAndScore(
          title: title,
          userId: userId!,
          coins: coins,
          addCoin: addCoin,
          score: score,
          type: type,
        )
        .then(
          (v) => emit(
            UpdateScoreAndCoinsSuccess(coins: v.coins, score: v.score),
          ),
        )
        .catchError(
          (dynamic e) => emit(UpdateScoreAndCoinsFailure(e.toString())),
        );
  }
}
