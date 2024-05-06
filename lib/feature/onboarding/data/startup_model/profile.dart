import 'other.dart';
import 'personal.dart';

class Profile {
  Personal? personal;
  Other? other;

  Profile({this.personal, this.other});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        personal: json['personal'] == null
            ? null
            : Personal.fromJson(json['personal'] as Map<String, dynamic>),
        other: json['other'] == null
            ? null
            : Other.fromJson(json['other'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'personal': personal?.toJson(),
        'other': other?.toJson(),
      };
}
