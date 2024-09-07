class Prayer {
  int index;
  String azan;
  String iqama;
  String prayer;

  Prayer({
    this.index = -1,
    this.azan = '',
    this.iqama = '',
    this.prayer = '',
  });

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(
      index: json['index'] ?? -1,
      azan: json['azan'] ?? '',
      iqama: json['iqama'] ?? '',
      prayer: json['prayer'] ?? '',
    );
  }

  Prayer copyWith({
    int? index,
    String? azan,
    String? iqama,
    String? prayer,
  }) {
    return Prayer(
      azan: azan ?? this.azan,
      index: index ?? this.index,
      iqama: iqama ?? this.iqama,
      prayer: prayer ?? this.prayer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'azan': azan,
      'index': index,
      'iqama': iqama,
      'prayer': prayer,
    };
  }
}
