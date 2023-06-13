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

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shade_theming/shade_theming.dart';

/// Main class that contains basic properties to build up this UI package.
class JappeOsDesktopUI {
  /// The default border radius for all of the widgets.
  static double getDefaultBorderRadius() => 10;

  /// The default REDUCED border radius for all of the widgets.
  static double getDefaultBorderRadiusRedc() => 5;

  /// A glassy border color used only by this package.
  static Color theme_customBorderColor(BuildContext ctx) =>
      ctx.watch<ShadeThemeProvider>().getTheme() == 0 ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2);

  /// The default background color for glassy fields.
  static Color theme_customGlassFieldBgColor(BuildContext ctx) =>
      ctx.watch<ShadeThemeProvider>().getCurrentThemeProperties().backgroundColor1.withOpacity(theme_defaultGlassFieldTransparency());

  /// The default transparency of glass fields. A field here is a button, text field, etc.
  static double theme_defaultGlassFieldTransparency() => 0.1;

  /// The default border thickness.
  static double theme_defaultBorderSize() => 1.5;
}
