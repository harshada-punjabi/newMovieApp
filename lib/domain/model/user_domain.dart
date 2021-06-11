import 'package:flutter_base_architecture/dto/base_dto.dart';
import 'package:newfluttermovieapp/presentation/model/user_item.dart';

class UserDomain extends BaseDto {
  int userId = -1;
  UserDomain({
    this.userId: -1,
  });

  @override
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["userId"] = userId;
    return map;
  }

  UserDomain.fromJson(Map<String, dynamic> objects) {
    userId = objects["userId"];
  }
}

extension UserExtention on UserDomain {
  UserItem mapToUserPresentation() => UserItem(
        id: this.userId,
      );
}
