import 'package:flutter/material.dart';

class SchoolDropdownMenuItem<T> {
  const SchoolDropdownMenuItem({
    required this.value,
    required this.label,
    required this.child,
  });

  final T? value;
  final String label;
  final Widget child;
}

class SelectionOption {
  const SelectionOption({
    required this.id,
    required this.label,
  });

  final int? id;
  final String? label;

  factory SelectionOption.fromJson(Map<String, dynamic> json) {
    return SelectionOption(
      id: json["id"] as int?,
      label: json["label"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
      };
}
