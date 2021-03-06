import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import './app_bar.dart';


class HeroExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Hero Examples",
            showGoBack: true,
          ),
          new Expanded(
            child: Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HeroPhotoViewWrapper(
                          imageProvider: AssetImage("assets/large-image.jpg"),
                        ),
                      )
                  );
                },
                child: Container(
                    child: Hero(
                      tag: "someTag",
                      child: Image.asset(
                          "assets/large-image.jpg",
                          width: 150.0
                      ),
                    )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}

class HeroPhotoViewWrapper extends StatelessWidget{
  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Color backgroundColor;
  final dynamic minScale;
  final dynamic maxScale;

  const HeroPhotoViewWrapper({
    this.imageProvider,
    this.loadingChild,
    this.backgroundColor,
    this.minScale,
    this.maxScale
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: new PhotoView(
        imageProvider: imageProvider,
        loadingChild: loadingChild,
        backgroundColor: backgroundColor,
        minScale: minScale,
        maxScale: maxScale,
        heroTag: "someTag",
      )
    );
  }

}