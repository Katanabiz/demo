part of global_widgets;

class CustomDropdownWidget extends StatefulWidget {
  const CustomDropdownWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.initialValue,
    this.errorMessage = 'Should select item from dropdown list',
    required this.list,
    this.width = 1.0,
    this.validate = false,
    this.display = true,
    this.enable = false,
    required this.onChange,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.bottomDistance = 15,
    this.margin = const EdgeInsets.only(left: 20, right: 20),
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final String? initialValue;
  final String errorMessage;
  final List<dynamic> list;
  final bool validate;
  final bool display;
  final bool enable;
  final double width;
  final Function onChange;
  final Color? textColor;
  final Color? backgroundColor;
  final double bottomDistance;
  final EdgeInsets margin;
  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  var dropDownIsValidate = false;

  @override
  Widget build(BuildContext context) {
    return widget.display
        ? IgnorePointer(
            ignoring: widget.enable,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Visibility(
                    visible: widget.labelText != '',
                    child: Container(
                      padding: widget.margin,
                      child: Text(
                        widget.labelText,
                        textScaleFactor: 1,
                        style: Get.textTheme.bodyText2!.merge(TextStyle(
                            color: Get.theme.primaryColor, fontSize: 16)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          border: Border.all(
                              color: dropDownIsValidate
                                  ? Colors.red
                                  : Colors.black)),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 12),
                      margin: widget.margin,
                      child: Center(
                        child: DropdownButtonFormField<int>(
                          icon: Icon(
                            LineIcons.angleDown,
                            color: Colors.black,
                            size: 15,
                          ),
                          validator: widget.validate
                              ? (v) {
                                  if (v == null) {
                                    setState(() {
                                      dropDownIsValidate = true;
                                    });
                                    return null;

                                    // return 'field required';
                                  } else {
                                    setState(() {
                                      dropDownIsValidate = false;
                                    });
                                  }

                                  return null;
                                }
                              : null,
                          value: widget.initialValue == null
                              ? null
                              : int.parse(widget.initialValue!),
                          items: List<DropdownMenuItem<int>>.generate(
                              widget.list.length, (int index) {
                            return DropdownMenuItem<int>(
                              value: widget.list[index]['id'],
                              child: Transform.translate(
                                offset: Offset(0, 2),
                                child: Text(
                                  widget.list[index]['name'] + ' ',
                                  textScaleFactor: 1,
                                  style:
                                      Get.textTheme.bodyText1!.merge(TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  )),
                                ),
                              ),
                            );
                          }),
                          hint: Transform.translate(
                            offset: Offset(0, 2),
                            child: Text(
                              widget.hintText,
                              textScaleFactor: 1,
                              style: Get.textTheme.caption!.merge(TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          onChanged: (value) {
                            widget.onChange(value);
                          },
                          decoration: InputDecoration.collapsed(
                            filled: widget.backgroundColor != null,
                            fillColor: widget.backgroundColor,
                            hintText: '',
                          ),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 7, left: 23, right: 23),
                    child: Visibility(
                        visible: dropDownIsValidate,
                        child: Container(
                            padding: EdgeInsets.only(left: 10, right: 12),
                            child: Text(
                              widget.errorMessage.tr,
                              textScaleFactor: 1,
                              style: Get.textTheme.bodyText1!.merge(TextStyle(
                                fontSize: 12,
                                color: Colors.red[200],
                                fontWeight: FontWeight.w100,
                              )),
                            ))),
                  ),
                  SizedBox(
                    height: widget.bottomDistance,
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
