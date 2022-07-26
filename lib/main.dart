import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/api/api_provider.dart';

import 'connection/bloc/connected_bloc.dart';
import 'home_screen/bloc/song_bloc.dart';
import 'home_screen/view/home_screen_view.dart';
import 'secondary_screen/bloc/secondsong_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiProvider(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                SongBloc(RepositoryProvider.of(context))..add(LoadApiEvent()),
          ),
          BlocProvider(
            create: (context) => SecondsongBloc(RepositoryProvider.of(context)),
          ),
          BlocProvider(
            create: (context) => ConnectedBloc(),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
