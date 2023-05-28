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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shade_theming/shade_theming.dart';

/// A simple loading indicator.
class DeuiLoadingIndicator extends StatefulWidget {
  const DeuiLoadingIndicator({Key? key, this.bigger = false}) : super(key: key);

  final bool bigger;

  @override
  _DeuiLoadingIndicatorState createState() => _DeuiLoadingIndicatorState();
}

/// The [State] class for [DeuiLoadingIndicator].
class _DeuiLoadingIndicatorState extends State<DeuiLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<ShadeThemeProvider>().getTheme() == 0) {
      return SvgPicture.asset(
        'resources/images/loading_lightth.svg',
        package: "jappeos_desktop_ui",
        width: !widget.bigger ? 30.0 : 90.0,
        height: !widget.bigger ? 30.0 : 90.0,
      );
    } else {
      return SvgPicture.asset(
        'resources/images/loading_darkth.svg',
        package: "jappeos_desktop_ui",
        width: !widget.bigger ? 30.0 : 90.0,
        height: !widget.bigger ? 30.0 : 90.0,
      );
    }
  }
}
