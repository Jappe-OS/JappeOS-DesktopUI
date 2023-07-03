//  JappeOS-DesktopUI, UI Widgets for JappeOS Desktop & Login.
//  Copyright (C) 2023  Jappe02
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as
//  published by the Free Software Foundation, either version 3 of the
//  License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jappeos_desktop_ui/jappeos_desktop_ui.dart';
import 'package:jappeos_desktop_ui/widgets/blur_container.dart';

/// A container with a solid background.
class DeuiSolidContainer extends StatefulWidget {
  /// The child inside the widget.
  final Widget child;

  /// Whether to show a border or not.
  final bool? bordered;

  /// The width of the widget.
  final double? width;

  /// The height of the widget.
  final double? height;

  /// Toggle border radius on different corners.
  final BorderRadiusSides? radiusSides;

  /// Whether to use a smaller variant of border radius.
  final bool? reducedRadius;

  const DeuiSolidContainer({Key? key, required this.child, this.bordered, this.width, this.height, this.radiusSides, this.reducedRadius})
      : super(key: key);

  @override
  _DeuiSolidContainerState createState() => _DeuiSolidContainerState();
}

/// The [State] class for [DeuiSolidContainer].
class _DeuiSolidContainerState extends State<DeuiSolidContainer> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = Theme.of(context).brightness == Brightness.light ? const Color.fromARGB(77, 255, 255, 255) : const Color.fromARGB(77, 0, 0, 0);

    bool reducedRadius = widget.reducedRadius ?? false;

    BorderRadiusGeometry brg = BorderRadius.only(
      topLeft: widget.radiusSides!.topLeft
          ? (!reducedRadius
              ? Radius.circular(JappeOsDesktopUI.getDefaultBorderRadius())
              : Radius.circular(JappeOsDesktopUI.getDefaultBorderRadiusRedc()))
          : Radius.zero,
      topRight: widget.radiusSides!.topRight
          ? (!reducedRadius
              ? Radius.circular(JappeOsDesktopUI.getDefaultBorderRadius())
              : Radius.circular(JappeOsDesktopUI.getDefaultBorderRadiusRedc()))
          : Radius.zero,
      bottomLeft: widget.radiusSides!.bottomLeft
          ? (!reducedRadius
              ? Radius.circular(JappeOsDesktopUI.getDefaultBorderRadius())
              : Radius.circular(JappeOsDesktopUI.getDefaultBorderRadiusRedc()))
          : Radius.zero,
      bottomRight: widget.radiusSides!.bottomRight
          ? (!reducedRadius
              ? Radius.circular(JappeOsDesktopUI.getDefaultBorderRadius())
              : Radius.circular(JappeOsDesktopUI.getDefaultBorderRadiusRedc()))
          : Radius.zero,
    );

    return ClipRRect(
      borderRadius: brg,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: brg,
          border: (widget.bordered ?? false) ? Border.all(width: 1.5, color: borderColor) : null,
          color: Theme.of(context).colorScheme.background,
        ),
        child: widget.child,
      ),
    );
  }
}
