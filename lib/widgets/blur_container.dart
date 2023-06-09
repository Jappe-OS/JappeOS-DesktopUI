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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jappeos_desktop_ui/jappeos_desktop_ui.dart';

class BorderRadiusSides {
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;

  BorderRadiusSides(this.topLeft, this.topRight, this.bottomLeft, this.bottomRight);
}

/// A container with a blurred background.
class DeuiBlurContainer extends StatefulWidget {
  /// The child inside the widget.
  final Widget child;

  /// Adds a nice gradient & glassy effect to the blur.
  final bool? gradient;

  /// Whether to show a border or not.
  final bool? bordered;

  /// Whether the element has a shadow.
  final bool hasShadow;

  /// The width of the widget.
  final double? width;

  /// The height of the widget.
  final double? height;

  /// Toggle border radius on different corners.
  final BorderRadiusSides? radiusSides;

  /// Whether to use a smaller variant of border radius.
  final bool? reducedRadius;

  const DeuiBlurContainer(
      {Key? key, required this.child, this.gradient, this.bordered, this.hasShadow = true, this.width, this.height, this.radiusSides, this.reducedRadius})
      : super(key: key);

  @override
  _DeuiBlurContainerState createState() => _DeuiBlurContainerState();
}

/// The [State] class for [DeuiBlurContainer].
class _DeuiBlurContainerState extends State<DeuiBlurContainer> {
  @override
  Widget build(BuildContext context) {
    int gradientSecondColorChange = 100;
    double backgroundOpacity = 0.6;

    bool reducedRadius = widget.reducedRadius ?? false;

    BorderRadiusGeometry brg = widget.radiusSides != null
        ? BorderRadius.only(
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
          )
        : const BorderRadius.all(Radius.zero);

    List<Color> gradientColors() {
      if (Theme.of(context).brightness == Brightness.light) {
        return [
          Color.fromRGBO(255, 255, 255, backgroundOpacity),
          Color.fromRGBO(255 - gradientSecondColorChange, 255 - gradientSecondColorChange, 255 - gradientSecondColorChange, backgroundOpacity)
        ];
      } else {
        return [
          Color.fromRGBO(0, 0, 0, backgroundOpacity),
          Color.fromRGBO(0 + gradientSecondColorChange, 0 + gradientSecondColorChange, 0 + gradientSecondColorChange, backgroundOpacity)
        ];
      }
    }

    Color borderColor =
        Theme.of(context).brightness == Brightness.light ? const Color.fromARGB(77, 255, 255, 255) : const Color.fromARGB(77, 0, 0, 0);

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: widget.hasShadow ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 4),
          ),
        ] : null,
      ),
      child: ClipRRect(
        borderRadius: brg,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19, tileMode: TileMode.repeated),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "resources/images/blur_noise.png",
                  package: "jappeos_desktop_ui",
                ),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
                scale: 7,
                opacity: 0.035,
              ),
              gradient: (widget.gradient ?? false)
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: gradientColors(),
                    )
                  : null,
              borderRadius: brg,
              border: (widget.bordered ?? false) ? Border.all(width: 1.5, color: borderColor) : null,
              color: (widget.gradient ?? false)
                  ? null
                  : (Theme.of(context).brightness == Brightness.light
                      ? Color.fromRGBO(255 - 35, 255 - 35, 255 - 35, backgroundOpacity)
                      : Color.fromRGBO(0 + 35, 0 + 35, 0 + 35, backgroundOpacity)),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
