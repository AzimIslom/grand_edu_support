part of 'imports.dart';

class _Item extends StatelessWidget {
  final ALModel al;
  final MaskTextInputFormatter mask;

  const _Item({
    Key? key,
    required this.al,
    required this.mask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
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
            '${DateFormat.Hm().format(al.meeting)}, ${mask.maskText(al.student)}',
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "    ${al.target}",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
