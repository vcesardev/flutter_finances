import 'package:flutter/material.dart';
import 'package:flutter_finances/config/colors.dart';
import 'package:flutter_finances/models/category_sum.dart';
import 'package:flutter_finances/utils/masks.dart';

class MonthCategory extends StatelessWidget {
  const MonthCategory({super.key, required this.category});
  final CategorySum category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          child: Container(
            color: category.color,
            width: 5,
            height: double.infinity,
          ),
        ),
        title: Text(
          category.category,
          style: TextStyle(color: CustomColors().title, fontSize: 16),
        ),
        trailing: RichText(
          text: TextSpan(
            text: 'R\$',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: CustomColors().title,
                fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                text: '${Masks().formatValueToPrice(category.total)}      ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
