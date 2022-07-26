import 'package:flutter/material.dart';
import 'package:music_app/secondary_screen/view/second_page.dart';

class SongTitleCard extends StatefulWidget {
  final String songTitle;
  final String album;
  final String star;
  final int trackId;
  const SongTitleCard(
      {Key? key,
      required this.songTitle,
      required this.album,
      required this.star,
      required this.trackId})
      : super(key: key);

  @override
  State<SongTitleCard> createState() => _SongTitleCardState();
}

class _SongTitleCardState extends State<SongTitleCard> {
  final apiKey = '23017ec149c4b30f8d20e510a9e801b6';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(trackId: widget.trackId),
                ));
          },
          child: ListTile(
            leading: const Icon(Icons.library_music),
            title: Text(
              widget.songTitle.substring(0,
                  widget.songTitle.length > 15 ? 15 : widget.songTitle.length),
              maxLines: 1,
              // style: TextStyle(),
            ),
            subtitle: Text(
              widget.album,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              widget.star,
              maxLines: 1,
            ),
          ),
        ),
        const Divider(
          indent: 12,
          endIndent: 12,
          color: Colors.black,
        )
      ],
    );
  }
}
