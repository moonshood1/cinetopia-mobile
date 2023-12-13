import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBar(
      {required this.title,
      required this.backFunction,
      required this.basicColor,
      required this.isExpandable,
      required this.hasFilter,
      super.key})
      : preferredSize = const Size.fromHeight(70.0);

  final String title;
  final void Function() backFunction;
  final Color basicColor;
  final bool isExpandable, hasFilter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          isExpandable
              ? GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.expand_more,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              : Container(
                  child: null,
                ),
          hasFilter
              ? IconButton(
                  onPressed: () {
                    showModalMethod(context, title);
                  },
                  icon: const Icon(
                    Icons.sort,
                    color: Colors.black,
                    size: 30,
                  ),
                )
              : Container(
                  child: null,
                ),
        ],
      ),
      elevation: 2,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: basicColor.withOpacity(0.10),
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              basicColor,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showModalMethod(BuildContext context, String type) {
    Widget modalContentWiget;

    // switch (type) {
    //   case "Quizz":
    //     modalContentWiget =
    //     break;
    //   default:
    // }
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Zone de filtre $type",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
