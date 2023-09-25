part of 'imports.dart';

class _Item extends StatelessWidget {
  final TaskModel task;

  const _Item({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.cat,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            task.task,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat.yMd().format(task.deadline),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                DateFormat.Hm().format(task.deadline),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // Text(task)
            ],
          ),
        ],
      ),
    );
  }
}
