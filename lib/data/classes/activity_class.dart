class Activity {
  final String activity;
  final num availability; // ✅ 核心修改：用num接收int/double 兼容两种数值类型
  final String type;
  final int participants;
  final num price; // ✅ 核心修改：用num接收int/double 兼容两种数值类型
  final String accessibility;
  final String duration;
  final bool kidFriendly;
  final String link; // ✅ 非null、支持空字符串""、纯String
  final String key;

  const Activity({
    required this.activity,
    required this.availability,
    required this.type,
    required this.participants,
    required this.price,
    required this.accessibility,
    required this.duration,
    required this.kidFriendly,
    required this.link,
    required this.key,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'activity': String activity,
        'availability': num availability, // ✅ 匹配int/double 都通过
        'type': String type,
        'participants': int participants,
        'price': num price, // ✅ 匹配int/double 都通过
        'accessibility': String accessibility,
        'duration': String duration,
        'kidFriendly': bool kidFriendly,
        'link': String link, // ✅ 只匹配字符串(含空字符串)，null直接抛异常
        'key': String key,
      } =>
        Activity(
          activity: activity,
          availability: availability,
          type: type,
          participants: participants,
          price: price,
          accessibility: accessibility,
          duration: duration,
          kidFriendly: kidFriendly,
          link: link,
          key: key,
        ),
      _ => throw const FormatException('Failed to load activity.'),
    };
  }

  // 实体转JSON，开发必备，数值类型自动还原
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'availability': availability,
      'type': type,
      'participants': participants,
      'price': price,
      'accessibility': accessibility,
      'duration': duration,
      'kidFriendly': kidFriendly,
      'link': link,
      'key': key,
    };
  }

  // 重写toString，调试时查看完整数据
  @override
  String toString() {
    return 'Activity(activity: $activity, availability: $availability, type: $type, participants: $participants, price: $price, accessibility: $accessibility, duration: $duration, kidFriendly: $kidFriendly, link: "$link", key: $key)';
  }
}
