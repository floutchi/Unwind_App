import 'package:unwind_app/src/invite/invite_service.dart';

class InviteController {
  InviteController(this._inviteService);

  final InviteService _inviteService;

  Future<void> invite(int periodId, String email) async =>
      await _inviteService.invite(periodId, email);
}
