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
import 'package:jappeos_desktop_ui/widgets/container.dart';

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
  @Deprecated("Gradient is not supported anymore! Might lead into messy looking UI!")
  final bool gradient;

  /// Whether to show a border or not.
  final bool bordered;

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
      {Key? key,
      required this.child,
      this.gradient = false,
      this.bordered = false,
      this.hasShadow = true,
      this.width,
      this.height,
      this.radiusSides,
      this.reducedRadius})
      : super(key: key);

  @override
  _DeuiBlurContainerState createState() => _DeuiBlurContainerState();
}

/// The [State] class for [DeuiBlurContainer].
class _DeuiBlurContainerState extends State<DeuiBlurContainer> {
  @override
  Widget build(BuildContext context) {
    double backgroundOpacity = 0.8;

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

    LinearGradient gradientBackground() {
      List<Color> gradientColors() {
        int gradientSecondColorChange = 100;

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

      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: gradientColors(),
      );
    }

    Color solidBackgroundColor() {
      int mod = 10;

      return Theme.of(context).brightness == Brightness.light
          ? Color.fromRGBO(255 - mod, 255 - mod, 255 - mod, backgroundOpacity)
          : Color.fromRGBO(0 + mod, 0 + mod, 0 + mod, backgroundOpacity);
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: brg,
        border: widget.bordered ? borderOuter(solidBackgroundColor()) : null,
        boxShadow: widget.hasShadow
            ? [
                shadow(),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: brg,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19, tileMode: TileMode.repeated),
          child: Container(
            width: widget.width,
            height: widget.height,
            /*padding: EdgeInsets.all(bordersWidth()),*/
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  "resources/images/blur_noise.png",
                  package: "jappeos_desktop_ui",
                ),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
                scale: 7,
                opacity: 0.038,
              ),
              gradient: widget.gradient ? gradientBackground() : null,
              borderRadius: brg,
              border: widget.bordered ? borderInner(context) : null,
              color: !widget.gradient ? solidBackgroundColor() : null,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
