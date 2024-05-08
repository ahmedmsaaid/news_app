import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view_model/cubits/News_cubit/news_cubit.dart';

class FilterItems extends StatelessWidget {
  const FilterItems({required this.iaSelected,required this.text, required this.onTap,super.key});
  final void Function()? onTap;
  final String text;
  final bool? iaSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit=NewsCubit
            .get(context);
        return Material(
          color:iaSelected!? Colors.red:Colors.grey,
          borderRadius: BorderRadius.circular(12),



          child: InkWell(
            borderRadius: BorderRadius.circular(12),


            onTap: onTap,
            child: Container(

              padding: EdgeInsets.all(12),

              decoration: BoxDecoration(




                borderRadius: BorderRadius.circular(12),
                border:Border.all(color: Colors.black,

                )
              ),
              child: Text(
                  text


              ),
            ),
          ),
        );
      },
    );
  }
}
