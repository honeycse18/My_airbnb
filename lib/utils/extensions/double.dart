
import 'package:airbnb_app/utils/utils.dart';

extension CurrencyText on double {
  String get toDollarCurrencyFormat => AppUtils.formatDollarCurrentAmount(this);
  String get toDollarNoDecimalCurrencyFormat =>
      AppUtils.formatDollarCurrentAmount(this, showDecimal: true);
}
