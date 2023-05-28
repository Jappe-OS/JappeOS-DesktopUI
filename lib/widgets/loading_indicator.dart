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
    return CircularProgressIndicator(
      color: context.watch<ShadeThemeProvider>().getCurrentThemeProperties().accentColor,
      strokeCap: StrokeCap.round,
    );
  }
}
