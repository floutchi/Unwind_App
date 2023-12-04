import 'package:flutter/material.dart';
import 'package:unwind_app/dto/period_dto.dart';
import 'package:unwind_app/model/period.dart';
import 'package:unwind_app/src/periods_listing/periods_listing_service.dart';

class PeriodsListingController with ChangeNotifier {
  PeriodsListingController(this._periodsListingService);

  final PeriodsListingService _periodsListingService;

  late List<Period> _periods;
  List<Period> get periods => _periods;

  Future<void> initPeriods() async {
    final periodsDTO = await _periodsListingService.periods();
    _periods = periodsDTO.map(Period.fromDTO).toList();
    notifyListeners();
  }

  Future<Period> getPeriod(int id) async {
    final dto = await _periodsListingService.period(id);
    final period = Period.fromDTO(dto);

    _periods[_periods.indexWhere((p) => p.id == period.id)] = period;
    notifyListeners();

    return period;
  }

  Period period(int id) => _periods.firstWhere((p) => p.id == id);

  Future<void> createPeriod(Period period) async {
    final dto = periodToDTO(period);

    final createdDTO = await _periodsListingService.createPeriod(dto);
    _periods.add(Period.fromDTO(createdDTO));
    notifyListeners();
  }

  Future<void> editPeriod(Period period) async {
    final dto = periodToDTO(period);
    await _periodsListingService.editPeriod(period.id, dto);

    _periods[_periods.indexWhere((p) => p.id == period.id)] = period;
    notifyListeners();
  }

  Future<void> removePeriod(int id) async {
    await _periodsListingService.removePeriod(id);
    _periods = _periods.where((p) => p.id != id).toList();
    notifyListeners();
  }
}
