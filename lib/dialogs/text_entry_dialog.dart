// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:material_themes_manager/material_themes_manager.dart';
import 'package:material_themes_widgets/forms/form_fields.dart';
import 'package:material_themes_widgets/fundamental/texts.dart';
import 'package:material_themes_widgets/utils/validators.dart';
import 'package:provider/provider.dart';

class TextEntryDialog extends StatefulWidget {

  final String? title;
  final ThemeGroupType titleType;
  final String? description;
  final ThemeGroupType descriptionType;
  final String? hintText;
  final String cancelButtonText;
  final String okButtonText;

  const TextEntryDialog({
    super.key,
    this.title,
    this.titleType = ThemeGroupType.POM,
    this.description,
    this.descriptionType = ThemeGroupType.MOM,
    this.hintText,
    this.cancelButtonText = "Cancel",
    this.okButtonText = "Ok"
  });

  @override
  TextEntryDialogState createState() => TextEntryDialogState();
}

class TextEntryDialogState extends State<TextEntryDialog> {

  final _formKey = GlobalKey<FormState>();
  String? userEnteredText;

  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var description = widget.description;

    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (title != null)... [
                  ThemedTitle(title, type: widget.titleType)
                ],
                if (description != null)...[
                  ThemedSubTitle(description, type: widget.descriptionType)
                ],
                ThemedEditableLabelValue(
                  showLabel: false,
                  hintText: widget.hintText ?? "",
                  validator:  (value) => nonEmptyValidator(value, widget.hintText ?? "", true),
                  onStringChangedCallback: (value) => setState(() => userEnteredText = value ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          // padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                          backgroundColor: context.watch<MaterialThemesManager>().colorPalette().lightBg,
                          shape: const StadiumBorder(),
                        ),
                        child: ThemedTitle(widget.cancelButtonText, type: ThemeGroupType.MOM),
                        onPressed: () {
                          _close();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                            backgroundColor: context.watch<MaterialThemesManager>().colorPalette().primary,
                            shape: const StadiumBorder(),
                          ),
                          child: ThemedTitle(widget.okButtonText, type: ThemeGroupType.MOP),
                          onPressed: () => _close()
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _close() async {
    if (mounted) Navigator.pop(context, userEnteredText);
  }
}