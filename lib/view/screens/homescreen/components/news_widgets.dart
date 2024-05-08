import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/news/article.dart';
import 'package:news_app/view_model/utils/app_assets.dart';

class NewsWidgets extends StatelessWidget {
   final Article artcle;
   const NewsWidgets({required this.artcle,super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              // image: DecorationImage(
              //     // alignment: Alignment(-.2, 0),
              //     image: NetworkImage(
              //         artcle.urlToImage??''),
              //     fit: BoxFit.cover),
            ),

            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(fit: StackFit.expand,


                children: [
                  ClipRRect(borderRadius: BorderRadius.circular(12),
                      child: Image.network(artcle.urlToImage??'',fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error_outline_rounded);
                      },)),
                  Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Text(
                        DateFormat.yMMM().format(DateTime.parse(artcle.publishedAt??'')),
                        style: TextStyle(color: Colors.white),
                      )),
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'By :${artcle.auther??''}',maxLines: 1,overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            artcle.description??'',
                            maxLines: 1,
                            softWrap: true,overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),],
                      )),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(artcle.content??'',maxLines: 1,overflow: TextOverflow.ellipsis,style: (TextStyle(color: Colors.white))
                      ,softWrap: true,),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

