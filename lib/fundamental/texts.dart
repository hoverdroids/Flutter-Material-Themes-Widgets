// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

abstract class ThemedText extends StatelessWidget {

  final String text;
  late final ThemeGroupType type;
  late final Emphasis emphasis;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  ThemedText(
      this.text,
      {
        super.key,
        type,
        emphasis,
        this.strutStyle,
        this.textAlign,
        this.textDirection,
        this.locale,
        this.softWrap,
        this.overflow,
        this.textScaleFactor,
        this.maxLines,
        this.semanticsLabel,
        this.textWidthBasis,
        this.textHeightBehavior
      }
  ){

    this.emphasis = emphasis ?? Emphasis.NONE;
    this.type = type ?? ThemeGroupType.MOM;
  }

  @override
  Widget build(BuildContext context) {

    var defaultText = Text(text);

    return Consumer<MaterialThemesManager> (
      builder: (context, themeManager, child) {
        return Text(
            text,
            key: key ?? defaultText.key,
            style: getTextStyle(themeManager.getTheme(type, emphasis: emphasis)),
            strutStyle: strutStyle ?? defaultText.strutStyle,
            textAlign: textAlign ?? defaultText.textAlign,
            textDirection: textDirection ?? defaultText.textDirection,
            locale: locale ?? defaultText.locale,
            softWrap: softWrap ?? defaultText.softWrap,
            overflow: overflow ?? defaultText.overflow,
            textScaleFactor: textScaleFactor ?? defaultText.textScaleFactor,
            maxLines: maxLines ?? defaultText.maxLines,
            semanticsLabel: semanticsLabel ?? defaultText.semanticsLabel,
            textWidthBasis: textWidthBasis ?? defaultText.textWidthBasis,
            textHeightBehavior: textHeightBehavior ?? defaultText.textHeightBehavior,
        );
      },
    );
  }

  //Subclasses just need to override this for magic pants to appear :p
  TextStyle? getTextStyle(ThemeData themeData);

}

class ThemedH1 extends ThemedText {

  ThemedH1(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
      : super(
      text,
      type: type,
      emphasis: emphasis,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior:textHeightBehavior
  );

  @override
  TextStyle? getTextStyle(ThemeData themeData) {
    return themeData.textTheme.displayLarge;
  }

}

class ThemedH2 extends ThemedText {

  ThemedH2(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.displayMedium;
}

class ThemedH3 extends ThemedText {

  ThemedH3(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.displaySmall;
}

class ThemedH4 extends ThemedText {

  ThemedH4(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.headlineMedium;
}

class ThemedH5 extends ThemedText {

  ThemedH5(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.headlineSmall;
}

class ThemedTitle extends ThemedText {

  ThemedTitle(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.titleLarge;
}

class ThemedSubTitle extends ThemedText {

  ThemedSubTitle(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.titleMedium;
}

class ThemedSubTitle2 extends ThemedText {

  ThemedSubTitle2(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.titleSmall;
}

class ThemedBody extends ThemedText {

  ThemedBody(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.bodyLarge;
}

class ThemedBody2 extends ThemedText {

  ThemedBody2(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.bodyMedium;
}

class ThemedCaption extends ThemedText {

  ThemedCaption(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.bodySmall;
}

class ThemedOverline extends ThemedText {

  ThemedOverline(
    text,
    {
      super.type,
      super.emphasis,
      super.key,
      super.strutStyle,
      super.textAlign,
      super.textDirection,
      super.locale,
      super.softWrap,
      super.overflow,
      super.textScaleFactor,
      super.maxLines,
      super.semanticsLabel,
      super.textWidthBasis,
      super.textHeightBehavior
    }
  ) : super(text);

  @override
  TextStyle? getTextStyle(ThemeData themeData) => themeData.textTheme.labelSmall;
}