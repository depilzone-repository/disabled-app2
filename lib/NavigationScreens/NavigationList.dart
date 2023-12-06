

import 'package:flutter/cupertino.dart';

class NavigationList{
    String label;
    Widget widget;
    bool showNabBar;
    Widget icon;
    Widget iconSelected;
    NavigationList(
        this.label,
        this.widget,
        this.showNabBar,
        this.icon,
        this.iconSelected
    );
}