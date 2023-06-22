import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_admin/util/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'custom_full_Image.dart';
import 'custom_videoPlayer.dart';
import 'material.dart';

class HtmlBodyWidget extends StatelessWidget {
  final String content;
  final bool isVideoEnabled;
  final bool isimageEnabled;
  final bool isIframeVideoEnabled;
  final double? fontSize;

  const HtmlBodyWidget({
    Key? key,
    required this.content,
    required this.isVideoEnabled,
    required this.isimageEnabled,
    required this.isIframeVideoEnabled,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        alignment: Alignment.center,
        child: Html(
          data: '''$content''',
          onLinkTap: (url, _, __) {
            openLinkWithCustomTab(context, url!);
          },
          style: {
            "body": Style(
              margin: Margins.all(2),
              alignment: Alignment.center,
              fontSize: fontSize == null ? FontSize(18.0) : FontSize(17.0),
              lineHeight: LineHeight(1.7),
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              // color: context.watch<ThemeBloc>().darkTheme == false ? CustomColor().bodyTextColorLight : CustomColor().bodyTextColorDark,
            ),
            "figure": Style(margin: Margins.zero,),

            //Disable this line to disble full width image/video
            "p,h1,h2,h3,h4,h5,h6": Style(margin: Margins.all(20)),
          },
          extensions: [
            TagExtension(
                tagsToExtend: {"iframe"},
                builder: (ExtensionContext eContext) {
                  final String _videoSource = eContext.attributes['src'].toString();
                  if (isIframeVideoEnabled == false) return Container();
                  if (_videoSource.contains('youtu')) {
                    return VideoPlayerWidget(videoUrl: _videoSource, videoType: 'youtube');
                  } else if (_videoSource.contains('vimeo')) {
                    return VideoPlayerWidget(videoUrl: _videoSource, videoType: 'vimeo');
                  }
                  return Container();
                }),
            TagExtension(
                tagsToExtend: {"video"},
                builder: (ExtensionContext eContext) {
                  final String videoSource = eContext.attributes['src'].toString();
                  if (isVideoEnabled == false) return Container();
                  return VideoPlayerWidget(videoUrl: videoSource, videoType: 'network');
                }),
            TagExtension(
                tagsToExtend: {"img"},
                builder: (ExtensionContext eContext) {
                  String imageUrl = eContext.attributes['src'].toString();
                  return InkWell(
                      onTap: () => nextScreen(context, FullScreenImage(imageUrl: imageUrl)),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) => const CircularProgressIndicator(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}