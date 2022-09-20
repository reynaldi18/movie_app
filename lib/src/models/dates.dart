import 'package:json_annotation/json_annotation.dart';

part 'dates.g.dart';

@JsonSerializable()
class Dates {
  @JsonKey(name: 'maximum')
  String? maximum;
  @JsonKey(name: 'minimum')
  String? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) =>
      _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
