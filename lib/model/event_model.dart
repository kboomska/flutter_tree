import 'dart:convert';

/// Модель События в Визарде.
class WizardEventModel {
  /// Идентификатор `id` События.
  int? id;

  /// Идентификатор `id` закрепленной Формы.
  int? formId;

  /// Заголовок События.
  String title;

  /// Длительность События.
  int duration;

  /// Допуск События.
  int tolerance;

  /// Модель События в Визарде.
  WizardEventModel({
    this.id,
    this.formId,
    required this.title,
    required this.duration,
    required this.tolerance,
  });

  WizardEventModel.blank()
      : title = 'Новое Событие',
        duration = 0,
        tolerance = 0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'formId': formId,
      'title': title,
      'duration': duration,
      'tolerance': tolerance,
    };
  }

  factory WizardEventModel.fromMap(Map<String, dynamic> map) {
    return WizardEventModel(
      id: map['id']?.toInt(),
      formId: map['formId']?.toInt(),
      title: map['title'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
      tolerance: map['tolerance']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WizardEventModel.fromJson(String source) =>
      WizardEventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '$WizardEventModel(id: $id, formId: $formId, title: $title,'
        ' duration: $duration, tolerance: $tolerance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WizardEventModel &&
        other.id == id &&
        other.formId == formId &&
        other.title == title &&
        other.duration == duration &&
        other.tolerance == tolerance;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        formId.hashCode ^
        title.hashCode ^
        duration.hashCode ^
        tolerance.hashCode;
  }
}
