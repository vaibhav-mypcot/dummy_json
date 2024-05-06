class ExtraTabs {
  bool? notificationIcon;

  ExtraTabs({this.notificationIcon});

  factory ExtraTabs.fromJson(Map<String, dynamic> json) => ExtraTabs(
        notificationIcon: json['notification_icon'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'notification_icon': notificationIcon,
      };
}
