import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/mmcs_news/mmcs_news_bloc.dart';

class NewsMmcsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsMmcsBloc>(
      create: (context) {
        return NewsMmcsBloc(NewsMmcsStateWithoutNews())
          ..add(NewsMmcsEventWithNews());
      },
      child: BlocConsumer<NewsMmcsBloc, NewsMmcsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is NewsMmcsStateWithNews) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,

                  itemBuilder: (BuildContext context, int index) => ListTile(title: Text(state.news_mmcs[index].text.substring(0, 55) + "..."), trailing: Icon(Icons.chevron_right_rounded),),
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Theme.of(context).hintColor,),
                ));
          }
          else if (state is NewsMmcsStateWithoutNews) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,

                  itemBuilder: (BuildContext context, int index) => ListTile(title: Text("Мехмат объявлен лучшим вузом страны"), trailing: Icon(Icons.chevron_right_rounded),),
                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Theme.of(context).hintColor,),
                ));
          }
          else return Text("Error");
        },
      ),
    );
    
  }
}