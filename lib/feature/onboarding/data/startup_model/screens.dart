import 'action.dart';
import 'extra_tabs.dart';
import 'home.dart';
import 'other.dart';
import 'personal.dart';
import 'profile.dart';

class Screens {
  Home? home;
  Personal? personal;
  Profile? profile;
  Other? other;
  Action? action;
  ExtraTabs? extraTabs;

  Screens({
    this.home,
    this.personal,
    this.profile,
    this.other,
    this.action,
    this.extraTabs,
  });

  factory Screens.fromJson(Map<String, dynamic> json) => Screens(
        home: json['home'] == null
            ? null
            : Home.fromJson(json['home'] as Map<String, dynamic>),
        personal: json['personal'] == null
            ? null
            : Personal.fromJson(json['personal'] as Map<String, dynamic>),
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        other: json['other'] == null
            ? null
            : Other.fromJson(json['other'] as Map<String, dynamic>),
        action: json['action'] == null
            ? null
            : Action.fromJson(json['action'] as Map<String, dynamic>),
        extraTabs: json['extra_tabs'] == null
            ? null
            : ExtraTabs.fromJson(json['extra_tabs'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'home': home?.toJson(),
        'personal': personal?.toJson(),
        'profile': profile?.toJson(),
        'other': other?.toJson(),
        'action': action?.toJson(),
        'extra_tabs': extraTabs?.toJson(),
      };
}
