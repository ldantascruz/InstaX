import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.picture,
  });

  static const empty = MyUser(
    id: '',
    email: '',
    name: '',
    picture: '',
  );

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      picture: picture,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      picture: entity.picture,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        picture,
      ];
}
