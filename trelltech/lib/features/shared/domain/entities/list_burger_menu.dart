import 'package:flutter/cupertino.dart';

class ListBurgerMenu {
  final String title;
  final Widget pages;
  bool selected;

  ListBurgerMenu(this.title, this.pages, this.selected);
}