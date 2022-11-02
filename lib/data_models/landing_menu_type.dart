import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recruitment_space/view/colors/tomisha_colors.dart';

part 'landing_menu_type.freezed.dart';

@freezed
class LandingMenuType with _$LandingMenuType {
  static const double _borderRadius = 12.0;

  const LandingMenuType._();

  const factory LandingMenuType.first() = FirstMenuType;

  const factory LandingMenuType.second() = SecondMenuType;

  const factory LandingMenuType.third() = ThirdMenuType;

  @override
  String toString() => when(
        first: () => 'Arbeitnehmer',
        second: () => 'Arbeitgeber',
        third: () => 'Temporärbüro',
      );

  Decoration? decoration(Color? onSelectColor) => when(
        first: () => BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(_borderRadius),
            bottomLeft: Radius.circular(_borderRadius),
          ),
          color: onSelectColor ?? Colors.white,
          border: _decoratioBorder(onSelectColor),
        ),
        second: () => BoxDecoration(
          color: onSelectColor ?? Colors.white,
          border: _decoratioBorder(onSelectColor),
        ),
        third: () => BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(_borderRadius),
            bottomRight: Radius.circular(_borderRadius),
          ),
          color: onSelectColor ?? Colors.white,
          border: _decoratioBorder(onSelectColor),
        ),
      );

  BoxBorder? _decoratioBorder(Color? onSelectColor) => onSelectColor == null
      ? Border.all(
          color: TomishaColors.lightGray,
        )
      : null;
}
