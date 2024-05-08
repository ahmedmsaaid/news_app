import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/screens/homescreen/components/filter_item_witgets.dart';
import 'package:news_app/view_model/cubits/News_cubit/news_cubit.dart';

class ModelBottons extends StatelessWidget {

  const ModelBottons({ super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return  Wrap(
            spacing: 10,
            runSpacing: 10,
            direction: Axis.horizontal,

            children:
              List.generate(cubit.Filters.length, (index) =>FilterItems(
                onTap: (){
                  cubit.ChangeSelectedFilrer(index);
                  cubit.sarechController.text=cubit.Filters[index];
                  cubit.gitHttp();
                },
                iaSelected:cubit.SelectedFilter==index ,
                text:cubit.Filters[index],


              ) )

            ,
          );
        },
      ),
    );
  }
}
