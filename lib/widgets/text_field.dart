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

// ignore_for_file: library_private_types_in_public_api, dead_code

import 'package:flutter/material.dart';
import 'package:jappeos_desktop_ui/jappeos_desktop_ui.dart';
import 'package:provider/provider.dart';
import 'package:shade_theming/main.dart';

/// A simple basic text field with a glassy hover & click effect.
class DeuiTextField extends StatefulWidget {
  /// The width of the text field.
  final double? width;

  /// The hint text of the field.
  final String? hintText;

  /// Set the margin of the button.
  final EdgeInsetsGeometry? margin;

  /// Sets the alignment of the button.
  final Alignment alignment;

  /// The [Function] triggered when the text of the text field has changed.
  final void Function(String)? onChanged;

  /// The [Function] triggered when submitted.
  final void Function(String)? onSubmit;

  const DeuiTextField({Key? key, this.hintText, this.width, this.margin, this.alignment = Alignment.topLeft, this.onChanged, this.onSubmit})
      : super(key: key);

  @override
  _DeuiTextFieldState createState() => _DeuiTextFieldState();
}

/// The [State] class for [DeuiTextField].
class _DeuiTextFieldState extends State<DeuiTextField> {
  @override
  Widget build(BuildContext context) {
    //Color accentColor = context.watch<ShadeThemeProvider>().getCurrentThemeProperties().accentColor;
    //double backgroundTransparency =
    //    widget.backgroundColor != null ? ((widget.backgroundColorTransp ?? true) ? 0.5 : widget.backgroundColor!.opacity) : 0.5;

    //double borderWidth = 1.5;
    //Color borderColor = context.watch<ShadeThemeProvider>().getTheme() == 0 ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2);

    return Align(
      alignment: widget.alignment,
      child: Container(
        width: widget.width,
        margin: widget.margin,
        child: TextField(
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmit,
          style: TextStyle(color: context.watch<ShadeThemeProvider>().getCurrentThemeProperties().normalTextColor),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: context.watch<ShadeThemeProvider>().getCurrentThemeProperties().normalTextColor.withOpacity(0.5)),
            filled: true,
            fillColor: JappeOsDesktopUI.theme_customGlassFieldBgColor(context),
            border: const OutlineInputBorder(),
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: JappeOsDesktopUI.theme_defaultBorderSize(), color: JappeOsDesktopUI.theme_customBorderColor(context)),
              borderRadius: BorderRadius.circular(JappeOsDesktopUI.getDefaultBorderRadius()),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: JappeOsDesktopUI.theme_defaultBorderSize(), color: JappeOsDesktopUI.theme_customBorderColor(context)),
              borderRadius: BorderRadius.circular(JappeOsDesktopUI.getDefaultBorderRadius()),
            ),
          ),
        ),
      ),
    );
  }
}
