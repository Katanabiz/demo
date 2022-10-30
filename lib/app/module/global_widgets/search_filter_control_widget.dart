part of global_widgets;

class SearchFilterControlWidget extends StatefulWidget {
  final Function onSubmit;
  final Function onPressSearchIcon;

  final Function onPressFilterIcon;
  final bool autofocus;
  SearchFilterControlWidget({
    required this.onSubmit,
    required this.onPressSearchIcon,
    required this.onPressFilterIcon,
    this.autofocus = false,
  });

  @override
  _SearchFilterControlWidgetState createState() =>
      _SearchFilterControlWidgetState();
}

class _SearchFilterControlWidgetState extends State<SearchFilterControlWidget> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 60,
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: Directionality(
                textDirection: HelperMS.dir(),
                child: TextField(
                  controller: search,
                  autofocus: widget.autofocus,
                  onSubmitted: (_) {
                    HelperMS.closeKeyboard();
                    widget.onSubmit();
                  },
                  onChanged: (_) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  style: Get.textTheme.bodyText1!.merge(TextStyle(
                    fontSize: 15,
                    height: 1.1,
                  )),
                  decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5),
                    hintStyle: Get.textTheme.bodyText1!
                        .merge(TextStyle(color: Colors.grey, fontSize: 15)),
                    border: OutlineInputBorder(),
                    hintText: 'Search'.tr,
                    prefixIcon: ScaleTap(
                      scaleMinValue: 2,
                      onPressed: () {},
                      child: IconButton(
                        onPressed: () {
                          HelperMS.closeKeyboard();
                          widget.onPressSearchIcon();
                        },
                        icon: Icon(
                          LineIcons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    suffixIcon: search.text.isEmpty
                        ? SizedBox()
                        : ScaleTap(
                            scaleMinValue: 2,
                            onPressed: () {},
                            child: Material(
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: () {
                                  HelperMS.closeKeyboard();
                                  search.text = "";
                                },
                                icon: Icon(
                                  LineIcons.times,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                    filled: false,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            scaleMinValue: 2,
            onPressed: () {},
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {
                  widget.onPressFilterIcon();
                },
                icon: Icon(
                  LineIcons.filter,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
