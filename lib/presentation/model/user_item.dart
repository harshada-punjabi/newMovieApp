
import 'package:newfluttermovieapp/domain/model/user_domain.dart';

class UserItem {
  final int id;
  UserItem({
    this.id,
  });

  bool isTemporaryUser() => this.id == -1;
}

extension DomainToPresenationExt on UserDomain {
  UserItem mapToPresentation() => UserItem(
    id: this.userId,
  );
}
