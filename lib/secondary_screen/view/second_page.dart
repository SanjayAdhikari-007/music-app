import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/secondsong_bloc.dart';
import '../widgets/text_two.dart';

class SecondPage extends StatefulWidget {
  final int trackId;
  const SecondPage({Key? key, required this.trackId}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of(context).close();
    BlocProvider.of<SecondsongBloc>(context).emit(SecondsongInitial());
    BlocProvider.of<SecondsongBloc>(context)
        .add(LoadSecondPageEvent(widget.trackId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Track Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<SecondsongBloc, SecondsongState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            if (state is SecondsongInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SecondPageSongLoaded) {
              return ListView(
                children: [
                  DetailTile(
                    descriptionName: 'Name',
                    description: state.model.songName,
                  ),
                  DetailTile(
                    descriptionName: 'Artist',
                    description: state.model.artistName,
                  ),
                  DetailTile(
                    descriptionName: 'Album Name',
                    description: state.model.albumName,
                  ),
                  DetailTile(
                    descriptionName: 'Explicit',
                    description: state.model.isExplicit.toString(),
                  ),
                  DetailTile(
                    descriptionName: 'Rating',
                    description: state.model.rating.toString(),
                  ),
                  DetailTile(
                    descriptionName: 'Lyrics',
                    description: state.model.lyrics.toString(),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
