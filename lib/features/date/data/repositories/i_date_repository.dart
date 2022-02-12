import 'package:flutter_date/features/date/data/data_sources/i_date_data_source.dart';
import 'package:flutter_date/features/date/domain/entities/now_date_entity.dart';

abstract class IDateRepository {
  NowDate getNowDate();
}
