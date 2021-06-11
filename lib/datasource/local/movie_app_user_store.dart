import 'dart:async';
import 'package:flutter_base_architecture/data/local/sharedpreferences/user_stores.dart';
import 'package:newfluttermovieapp/domain/model/user_domain.dart';
import 'package:newfluttermovieapp/presentation/model/user_item.dart';

class MovieAppStore extends UserStore<UserDomain> {

  @override
  Future<bool> setUser(UserDomain userDto) {
    return super.setUser(userDto);
  }

  @override
  UserDomain mapUserDto(decode) {
    print("UserDto> $decode");
    UserDomain user = UserDomain.fromJson(decode);
    return user;
  }

  Future<bool> forceLogoutUser() async {
    await removeUser();
    // _userSessionExpired.add(true);
    return true;
  }
}
