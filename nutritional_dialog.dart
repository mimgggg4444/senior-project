import 'package:flutter/material.dart';

class NutritionalContainer extends StatelessWidget {
  final dynamic nutritionalItem;

  const NutritionalContainer({super.key, required this.nutritionalItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: AlertDialog(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: Text(
                  nutritionalItem['PRDLST_NM'],
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '주된 기능성:',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      nutritionalItem["PRIMARY_FNCLTY"],
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '섭취시 주의사항:',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      nutritionalItem['IFTKN_ATNT_MATR_CN'],
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('닫기'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFF88B0FF),
          ),
        ),
        child: Center(
          child: Text(
            nutritionalItem['PRDLST_NM'],
            style: const TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1, // 필요한 경우 여러 줄로 설정할 수도 있습니다.
          ),
        ),
      ),
    );
  }
}
