import 'package:flutterquiz/features/wallet/models/paymentRequest.dart';
import 'package:flutterquiz/features/wallet/walletException.dart';
import 'package:flutterquiz/features/wallet/walletRemoteDataSource.dart';

class WalletRepository {
  factory WalletRepository() {
    _walletRepository._walletRemoteDataSource = WalletRemoteDataSource();
    return _walletRepository;
  }

  WalletRepository._internal();

  static final WalletRepository _walletRepository =
      WalletRepository._internal();

  late WalletRemoteDataSource _walletRemoteDataSource;

  Future<void> makePaymentRequest({
    required String userId,
    required String paymentType,
    required String paymentAddress,
    required String paymentAmount,
    required String coinUsed,
    required String details,
  }) async {
    try {
      await _walletRemoteDataSource.makePaymentRequest(
        userId: userId,
        paymentType: paymentType,
        paymentAddress: paymentAddress,
        paymentAmount: paymentAmount,
        coinUsed: coinUsed,
        details: details,
      );
    } catch (e) {
      throw WalletException(errorMessageCode: e.toString());
    }
  }

  Future<({int total, List<PaymentRequest> data})> getTransactions({
    required String userId,
    required String limit,
    required String offset,
  }) async {
    try {
      final (:total, :data) = await _walletRemoteDataSource.getTransactions(
        userId: userId,
        limit: limit,
        offset: offset,
      );

      return (
        total: total,
        data: data.map(PaymentRequest.fromJson).toList(),
      );
    } catch (e) {
      throw WalletException(errorMessageCode: e.toString());
    }
  }
}
