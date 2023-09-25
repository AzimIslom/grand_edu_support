part of 'imports.dart';

class _Item extends StatelessWidget {
  final AfterModel af;
  final MaskTextInputFormatter mask;
  final Function(bool) onTap;

  const _Item({
    Key? key,
    required this.af,
    required this.mask,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          af.stars.toString(),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 5),
        Image.asset(
          "assets/icons/star.png",
          height: 30,
          color: kPrimaryColor,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  builder: (_) => SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryLightColor,
                            ),
                            onPressed: () {
                              onTap(false);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/delete.png",
                                  height: 25,
                                  color: kPrimaryColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  lan(t.delete),
                                  style: const TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              onTap(true);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/save.png",
                                  height: 25,
                                  color: c.white,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  lan(t.workOn),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "    ${af.feedback}",
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    af.secret
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Text(
                                '${DateFormat.Hm().format(af.time)},',
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                mask.maskText(af.by),
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Saved extends StatelessWidget {
  final AfterModel af;
  final MaskTextInputFormatter mask;
  final Function(bool) onTap;

  const _Saved({
    Key? key,
    required this.af,
    required this.mask,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          af.stars.toString(),
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: 5),
        Image.asset(
          "assets/icons/star.png",
          height: 30,
          color: kPrimaryColor,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 3,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  builder: (_) => SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryLightColor,
                            ),
                            onPressed: () {
                              onTap(false);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/delete.png",
                                  height: 25,
                                  color: kPrimaryColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  lan(t.delete),
                                  style: const TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Ink(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "    ${af.feedback}",
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    af.secret
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Text(
                                '${DateFormat.Hm().format(af.time)},',
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                mask.maskText(af.by),
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  final TabController controller;

  const _Top({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<FeedbackVM>(
      create: (_) => FeedbackVM(),
      child: Consumer<FeedbackVM>(
        builder: (context, FeedbackVM vm, _) {
          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Ink(
              height: size.height * .065,
              width: size.width * .5,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  size.width * .08,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  physics: const BouncingScrollPhysics(),
                  splashBorderRadius: BorderRadius.circular(
                    size.width * .08,
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      // Use the default focused overlay color
                      return states.contains(MaterialState.focused)
                          ? null
                          : kPrimaryColor.withOpacity(.2);
                    },
                  ),
                  controller: controller,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      size.width * .08,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        color: kPrimaryColor.withOpacity(.4),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        offset: const Offset(0, -1),
                        color: kPrimaryColor.withOpacity(.1),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        offset: const Offset(-1, 0),
                        color: kPrimaryColor.withOpacity(.1),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        offset: const Offset(1, 0),
                        color: kPrimaryColor.withOpacity(.1),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                    ],
                    color: kPrimaryLightColor,
                  ),
                  tabs: [
                    Tab(
                      child: Image.asset("assets/icons/all.png"),
                    ),
                    Tab(
                      child: Image.asset("assets/icons/fix.png"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
