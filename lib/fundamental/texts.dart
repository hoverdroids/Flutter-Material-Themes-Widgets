import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:provider/provider.dart';

abstract class ThemedText extends StatelessWidget {

  final String text;
  final ThemeGroupType type;
  final Emphasis emphasis;
  final Key key;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior textHeightBehavior;

  ThemedText(this.text,
      {
        this.type = ThemeGroupType.MOM,
        this.emphasis = Emphasis.NONE,
        this.key,
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
  );

  @override
  Widget build(BuildContext context) {

    var defaultText = Text(text);

    return Consumer<MaterialThemesManager> (
      builder: (context, themeManager, child) {
        return Text(
            text,
            key: key != null ? key: defaultText.key,
            style: getTextStyle(themeManager.getTheme(type, emphasis: emphasis)),
            strutStyle: strutStyle != null ? strutStyle : defaultText.strutStyle,
            textAlign: textAlign != null ? textAlign : defaultText.textAlign,
            textDirection: textDirection != null ? textDirection : defaultText.textDirection,
            locale: locale != null ? locale : defaultText.locale,
            softWrap: softWrap != null ? softWrap: defaultText.softWrap,
            overflow: overflow != null ? overflow: defaultText.overflow,
            textScaleFactor: textScaleFactor != null ? textScaleFactor : defaultText.textScaleFactor,
            maxLines: maxLines != null ? maxLines : defaultText.maxLines,
            semanticsLabel: semanticsLabel != null ? semanticsLabel : defaultText.semanticsLabel,
            textWidthBasis: textWidthBasis != null ? textWidthBasis : defaultText.textWidthBasis,
            textHeightBehavior: textHeightBehavior != null ? textHeightBehavior : defaultText.textHeightBehavior,
        );
      },
    );
  }

  //Subclasses just need to override this for magic pants to appear :p
  TextStyle getTextStyle(ThemeData themeData);

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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline1;
  }

}

class ThemedH2 extends ThemedText {

  ThemedH2(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline2;
  }

}

class ThemedH3 extends ThemedText {

  ThemedH3(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline3;
  }

}

class ThemedH4 extends ThemedText {

  ThemedH4(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline4;
  }

}

class ThemedH5 extends ThemedText {

  ThemedH5(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline5;
  }

}

class ThemedTitle extends ThemedText {

  ThemedTitle(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.headline6;//title was depricated
  }

}

class ThemedSubTitle extends ThemedText {

  ThemedSubTitle(text, {key, type, emphasis, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.subtitle1;//title was depricated
  }

}

class ThemedSubTitle2 extends ThemedText {

  ThemedSubTitle2(text, {key, type, emphasis, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.subtitle2;
  }

}

class ThemedBody extends ThemedText {

  ThemedBody(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.bodyText1;
  }

}

class ThemedBody2 extends ThemedText {

  ThemedBody2(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.bodyText2;
  }

}

class ThemedCaption extends ThemedText {

  ThemedCaption(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.caption;
  }

}

class ThemedOverline extends ThemedText {

  ThemedOverline(text, {type, emphasis, key, strutStyle, textAlign, textDirection, locale, softWrap, overflow, textScaleFactor, maxLines, semanticsLabel, textWidthBasis, textHeightBehavior})
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
  TextStyle getTextStyle(ThemeData themeData) {
    return themeData.textTheme.overline;
  }

}