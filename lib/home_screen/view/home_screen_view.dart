import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/connection/bloc/connected_bloc.dart';

import '../home_screen.dart';
import '../widgets/song_title_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // systemOverlayStyle:
        //     const SystemUiOverlayStyle(statusBarColor: Colors.black),
        centerTitle: true,
        elevation: 7,
        backgroundColor: Colors.white54,
        title: const Text(
          'Trending',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<ConnectedBloc, ConnectedState>(
        builder: (context, state) {
          if (state is ConnectedSucessState) {
            return BlocBuilder<SongBloc, SongState>(
              builder: (context, state) {
                if (state is SongInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SongLoaded) {
                  return ListView.builder(
                    itemCount: state.models.length,
                    itemBuilder: (context, index) {
                      return SongTitleCard(
                        trackId: state.models[index].trackId,
                        songTitle: state.models[index].songName,
                        album: state.models[index].albumName,
                        star: state.models[index].artistName,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              },
            );
          } else if (state is ConnectedFailureState) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  Icon(Icons.wifi_off),
                  Text('Internet Not Connected')
                ]));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
// BlocBuilder<SongBloc, SongState>(
//         builder: (context, state) {
//           if (state is SongInitial) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is SongLoaded) {
//             return ListView.builder(
//               itemCount: state.models.length,
//               itemBuilder: (context, index) {
//                 return SongTitleCard(
//                   trackId: state.models[index].trackId,
//                   songTitle: state.models[index].songName,
//                   album: state.models[index].albumName,
//                   star: state.models[index].artistName,
//                 );
//               },
//             );
//           } else {
//             return const Center(
//               child: Text('Errror'),
//             );
//           }
//         },
//       )