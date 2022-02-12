import 'package:flutter_date/features/date/data/data_sources/i_date_data_source.dart';
import 'package:flutter_date/features/date/data/repositories/i_date_repository.dart';

import '../entities/now_date_entity.dart';

class DateRepository implements IDateRepository {
  final IDateDataSource iDateDataSource;

  DateRepository(this.iDateDataSource);

  @override
  NowDate getNowDate() {
    return NowDate(
        georgian: iDateDataSource.getNowGregorianDate(),
        hijri: iDateDataSource.getNowHijriDate(),
        jalali: iDateDataSource.getNowJalaliDate());
  }
}
