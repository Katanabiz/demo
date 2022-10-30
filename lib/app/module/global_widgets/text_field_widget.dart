part of global_widgets;

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    this.onSaved,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText = '',
    this.obscureText,
    this.suffixIcon,
    this.display = true,
    this.style,
    this.isItMobileNumber = false,
    this.isThereRadius = false,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.enable = false,
    this.isItLastField = false,
    this.bottomDistance = 15,
    this.backgroundColor = Colors.transparent,
    this.showShadow = false,
    this.areThereUnderLineBoarder = false,
    this.controller,
    this.padding =
        const EdgeInsets.only(top: 3, bottom: 0, left: 20, right: 20),
    this.width = double.infinity,
  });

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final Function? onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool? isItMobileNumber;
  final bool isThereRadius;
  final String? hintText;
  final String? errorText;
  final TextAlign textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool display;

  final Widget? suffixIcon;
  final Widget? suffix;
  final Color backgroundColor;
  final bool enable;
  final bool isItLastField;

  final double bottomDistance;
  final bool? showShadow;
  final bool? areThereUnderLineBoarder;
  final TextEditingController? controller;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return display
        ? IgnorePointer(
            ignoring: enable,
            child: Directionality(
              textDirection: HelperMS.dir(),
              child: Container(
                width: width,
                padding: padding,
                margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: isThereRadius ? buildBorderRadius : null,
                    boxShadow: showShadow!
                        ? [
                            BoxShadow(
                                color: Get.theme.focusColor.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5)),
                          ]
                        : null,
                    border: showShadow!
                        ? Border.all(
                            color: Get.theme.focusColor.withOpacity(0.05))
                        : null),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Directionality(
                      textDirection: HelperMS.dir(),
                      child: Visibility(
                        visible: labelText != '',
                        child: Text(
                          labelText ?? "",
                          textScaleFactor: 1,
                          style: Get.textTheme.bodyText1,
                          textAlign: textAlign,
                        ),
                      ),
                    ),
                    TextFormField(
                      textDirection: isItMobileNumber!
                          ? TextDirection.ltr
                          : HelperMS.dir(),
                      maxLines: keyboardType == TextInputType.multiline ? 3 : 1,
                      controller: controller,
                      keyboardType: keyboardType ?? TextInputType.text,
                      textInputAction: isItLastField
                          ? TextInputAction.done
                          : TextInputAction.next,
                      inputFormatters: keyboardType != TextInputType.phone
                          ? null
                          : [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                      onFieldSubmitted: onSubmitted != null
                          ? (_) {
                              onSubmitted!();
                            }
                          : null,
                      onSaved: onSaved,
                      onChanged: onChanged,
                      validator: validator,
                      initialValue: initialValue ?? '',
                      style: style ??
                          Get.textTheme.bodyText1!.merge(TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          )),
                      obscureText: obscureText ?? false,
                      textAlign: textAlign,
                      decoration: UiMS.getInputDecoration(
                        keyboardType: keyboardType,
                        textHintDirection: isItMobileNumber!
                            ? TextDirection.ltr
                            : HelperMS.dir(),
                        hintText: hintText ?? '',
                        areThereUnderLineBoarder: areThereUnderLineBoarder,
                        iconData: iconData,
                        suffixIcon: suffixIcon,
                        suffix: suffix,
                        errorText: errorText,
                      ),
                    ),
                    SizedBox(height: bottomDistance),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }

  BorderRadius get buildBorderRadius {
    return BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    return 20;
  }

  double get bottomMargin {
    return 10;
  }
}
