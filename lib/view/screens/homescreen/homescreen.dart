import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/view/screens/homescreen/components/filter_botton_widgets.dart';
import 'package:news_app/view/screens/homescreen/components/news_widgets.dart';
import 'package:news_app/view_model/cubits/News_cubit/news_cubit.dart';
import 'package:news_app/view_model/utils/app_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              return SearchBar(
                  onTap: () {cubit.gitHttp();

                    cubit.sesrchActive();
                  },
                  controller: cubit.sarechController,
                  trailing: [
                    IconButton(
                      onPressed: (){

                        cubit.gitHttp();
                      },icon: Icon
                      (Icons.search,)
                    ),
                  ]);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 25,
                  child: SvgPicture.asset(AppAssets.notifecations),
                ))
          ],
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Column(
              children: [
                Visibility(
                  visible: cubit.filteron,
                  replacement: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color:Colors.grey.withOpacity(.5)),
                          child: TextButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.filter_alt,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,

                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ModelBottons(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(.5)),
                          child: TextButton(
                            child: Text(
                              'Healthy',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                            onPressed: () {
                              cubit.sarechController.text='Healthy';cubit.gitHttp();
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(.5)),
                          child: TextButton(
                            child: Text(
                              'Technology',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                            onPressed: () {cubit.sarechController.text='Technology';cubit.gitHttp();},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(.5)),
                          child: TextButton(
                            child: Text(
                              'Finance',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ),
                            onPressed: () {cubit.sarechController.text='Finance';cubit.gitHttp();},
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        TextButton(onPressed: () {}, child: Text('See All'))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: BlocBuilder<NewsCubit, NewsState>(
  builder: (context, state) {
    return ListView.separated(
                      itemBuilder: (context, index) {
                        return NewsWidgets(artcle: cubit.artcles[index],);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 1,
                          ),
                      itemCount: cubit.artcles.length);
  },
),
                ),
              ],
            );
          },
        ));
  }
}
