part of global_widgets;

class PickupDateWidget extends StatefulWidget {
  PickupDateWidget({
    this.backgroundColor = Colors.transparent,
    this.showShadow = false,
    this.dateList = const [],
    this.title = '',
    this.validate = false,
    this.margin =
        const EdgeInsets.only(top: 3, bottom: 15, left: 20, right: 20),
  });
  final Color? backgroundColor;
  final bool? showShadow;
  final bool validate;
  final List<DateTime> dateList;
  final String title;
  final EdgeInsetsGeometry margin;

  @override
  _PickupDateWidgetState createState() => _PickupDateWidgetState();
}

class _PickupDateWidgetState extends State<PickupDateWidget> {
  DateTime date = DateTime(1920, 12, 12, 0, 0, 0, 0, 0);
  bool doOneTime = true;

  @override
  void initState() {
    if (widget.dateList.isNotEmpty) {
      date = widget.dateList[0];
    } else {
      widget.dateList.add(DateTime(1920, 12, 12, 0, 0, 0, 0, 0));
      date = widget.dateList[0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: widget.title != '',
            child: Text(
              widget.title,
              textScaleFactor: 1,
              style: Get.textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              _dateGregorianMethod();
            },
            child: Container(
                height: 50,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    boxShadow: widget.showShadow!
                        ? [
                            BoxShadow(
                                color: Get.theme.focusColor.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5)),
                          ]
                        : null,
                    color: widget.backgroundColor,
                    border: Border.all(
                      color: widget.validate ? Colors.red : Color(0XFFE0E0E0),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        date.year == 1920
                            ? Text(
                                'choose date'.tr + ' ',
                                textScaleFactor: 1,
                                style: date.year == 1920
                                    ? Get.textTheme.caption!.merge(TextStyle(
                                        color: Colors.grey.withOpacity(0.45),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ))
                                    : Get.textTheme.bodyText1!
                                        .merge(const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                      )),
                              )
                            : Chip(
                                onDeleted: () {
                                  defaultDateFunction();
                                },
                                deleteIcon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                label: Transform.translate(
                                  offset: Offset(0, 1),
                                  child: Text(
                                    DateMS.dateSlashFull(date),
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    if (date.year == 1920)
                      Container(
                          child: Transform.translate(
                              offset: Offset(0, -0.5),
                              child: Icon(
                                LineIcons.plus,
                                color: Get.theme.primaryColor,
                              ))),
                  ],
                )),
          ),
          //error message
          if (widget.validate)
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 7),
                child: Text(
                  'Should choose date'.tr + ' ',
                  textScaleFactor: 1,
                  style: Get.textTheme.bodyText1!.merge(TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w100,
                  )),
                ))
        ],
      ),
    );
  }

  //get appointment gregorian date method
  Future<void> _dateGregorianMethod() async {
    final DateTime? picked = await showDatePicker(
      locale:  const Locale('ar', '') ,
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: widget.dateList.isNotEmpty
          ? widget.dateList.first.year == 1920
              ? DateTime.now()
              : widget.dateList.first
          : DateTime.now(),
      firstDate: DateTime(1920, 12),
      lastDate: DateTime(2222, 12),
    );

    if (picked != null) {
      gregorianFunction(picked);
    }
    // if (picked == null) {
    //   defaultDateFunction();
    // }

    FocusScope.of(context).requestFocus(FocusNode());
  }

  //set gregorian date
  void gregorianFunction(dynamic gregorianDate) => setState(() {
        date = gregorianDate;
        widget.dateList.clear();
        widget.dateList.add(date);
        FocusScope.of(context).requestFocus(FocusNode());
      });

  //set default date
  void defaultDateFunction() => setState(() {
        date = DateTime(1920, 12, 12, 0, 0, 0, 0, 0);
        widget.dateList.clear();
        widget.dateList.add(date);
      });
}
