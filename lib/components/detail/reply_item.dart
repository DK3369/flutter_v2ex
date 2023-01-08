// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_v2ex/models/web/item_topic_reply.dart';
import 'package:flutter_v2ex/components/common/avatar.dart';

class ReplyListItem extends StatefulWidget {
  const ReplyListItem({required this.reply, super.key});
  final ReplyItem reply;
  @override
  State<ReplyListItem> createState() => _ReplyListItemState();
}

// class _ReplyListItemState extends State<ReplyListItem> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         margin: const EdgeInsets.only(top: 0, right: 16, bottom: 7, left: 62),
//         child: Material(
//           color: Theme.of(context).colorScheme.onInverseSurface,
//           borderRadius: BorderRadius.circular(10),
//           child: InkWell(
//             onTap: () {},
//             borderRadius: BorderRadius.circular(10),
//             child: Container(
//               padding: const EdgeInsets.only(
//                   top: 10, right: 14, bottom: 10, left: 10),
//               child: content(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget content() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         // 头像、昵称
//         Container(
//           margin: const EdgeInsets.only(bottom: 6),
//           padding: const EdgeInsets.only(bottom: 1),
//           child: Row(
//             // 两端对齐
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   const SizedBox(width: 6),
//                   SizedBox(
//                     width: 100,
//                     child: Text(
//                       widget.reply.userName,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: Theme.of(context).textTheme.labelLarge,
//                     ),
//                   ),
//                 ],
//               ),
//               // Material(
//               //   borderRadius: BorderRadius.circular(50),
//               //   color: Theme.of(context)
//               //       .colorScheme
//               //       .surfaceVariant
//               //       .withOpacity(0.5),
//               //   child: InkWell(
//               //     onTap: () {},
//               //     borderRadius: BorderRadius.circular(50),
//               //     child: Container(
//               //       padding: const EdgeInsets.symmetric(
//               //           vertical: 3.5, horizontal: 10),
//               //       child: Row(
//               //         // mainAxisSize: MainAxisSize.min,
//               //         crossAxisAlignment: CrossAxisAlignment.center,
//               //         children: [
//               //           // const Icon(Icons.workspaces_outlined, size: 14),
//               //           // const SizedBox(width: 2.5),
//               //           Text(
//               //             widget.reply.floorNumber,
//               //             style: const TextStyle(
//               //               fontSize: 11.0,
//               //               textBaseline: TextBaseline.ideographic,
//               //             ),
//               //           )
//               //         ],
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               Text('#${widget.reply.floorNumber}')
//             ],
//           ),
//         ),
//         // title
//         const Divider(
//           indent: 8,
//           endIndent: 2,
//           height: 1,
//         ),
//         Container(
//           // alignment: Alignment.centerLeft,
//           margin: const EdgeInsets.only(top: 5, bottom: 5),
//           child: Html(
//             data: widget.reply.contentRendered,
//             style: {
//               "html": Style(
//                 fontSize: FontSize(14),
//               ),
//               "a": Style(
//                 color: Theme.of(context).colorScheme.primary,
//                 textDecoration: TextDecoration.underline,
//               ),
//               "li > p": Style(
//                 display: Display.inline,
//               ),
//               "li": Style(
//                 padding: const EdgeInsets.only(bottom: 4),
//               ),
//             },
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             if (widget.reply.lastReplyTime.isNotEmpty) ...[
//               Text(
//                 widget.reply.lastReplyTime,
//                 style: Theme.of(context).textTheme.labelSmall,
//               ),
//               const SizedBox(width: 2)
//             ],
//           ],
//         )
//       ],
//     );
//   }
// }

class _ReplyListItemState extends State<ReplyListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 0, right: 14, bottom: 7, left: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lfAvtar(),
              const SizedBox(width: 8),
              Expanded(
                child: Material(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, right: 14, bottom: 6, left: 10),
                      child: content(context),
                    ),
                  ),
                ),
              ),
            ],
          )
          // child: Material(
          //   // color: Theme.of(context).colorScheme.onInverseSurface,
          //   color: Colors.transparent,
          //   borderRadius: BorderRadius.circular(10),
          //   child: InkWell(
          //     onTap: () {},
          //     borderRadius: BorderRadius.circular(10),
          //     child: Container(
          //       padding: const EdgeInsets.only(
          //           top: 10, right: 14, bottom: 10, left: 10),
          //       child: content2(),
          //     ),
          //   ),
          // ),
          ),
    );
  }

  Widget lfAvtar() {
    return GestureDetector(
      // onLongPress: () => {print('长按')},
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('提示'),
          content: const Text('确认花费10个铜板💰向该用户表示感谢'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('手误了'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('确定'),
            ),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        child: const CAvatar(
          url:
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202106%2F13%2F20210613235426_7a793.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1675688930&t=f9850700bd7de894a7e1652cb26e5566',
          size: 36,
        ),
      ),
    );
  }

  Widget content(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 头像、昵称
        Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.only(bottom: 1),
          child: Row(
            // 两端对齐
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 6),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 100, // 最大宽度
                    ),
                    child: Text(
                      widget.reply.userName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(width: 4),
                  if (widget.reply.isOwner) ...[
                    Icon(
                      Icons.person,
                      size: 15,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ]
                ],
              ),
              Text('#${widget.reply.floorNumber}')
            ],
          ),
        ),
        // title
        const Divider(
          indent: 8,
          endIndent: 2,
          height: 1,
        ),
        Container(
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          child: Html(
            data: widget.reply.contentRendered,
            style: {
              "html": Style(
                fontSize: FontSize(14),
              ),
              "a": Style(
                color: Theme.of(context).colorScheme.primary,
                textDecoration: TextDecoration.underline,
              ),
              "li > p": Style(
                display: Display.inline,
              ),
              "li": Style(
                padding: const EdgeInsets.only(bottom: 4),
              ),
              "image": Style(margin: const Margins())
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(width: 2),
                SizedBox(
                  height: 28.0,
                  width: 28.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(2.0),
                    // color: themeData.primaryColor,
                    icon: const Icon(Icons.favorite_outline, size: 18.0),
                    selectedIcon: const Icon(Icons.favorite, size: 18.0),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('提示'),
                        content: const Text('确认花费10个铜板💰向该用户表示感谢'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('手误了'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('确定'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                SizedBox(
                  height: 28.0,
                  width: 28.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(2.0),
                    // color: themeData.primaryColor,
                    icon: const Icon(Icons.chat_bubble_outline, size: 18.0),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 1),
                SizedBox(
                  height: 28.0,
                  width: 28.0,
                  child: IconButton(
                    padding: const EdgeInsets.all(2.0),
                    // color: themeData.primaryColor,
                    icon: const Icon(Icons.more_horiz_outlined, size: 18.0),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.reply.lastReplyTime.isNotEmpty) ...[
                  Text(
                    widget.reply.lastReplyTime,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  // const SizedBox(width: 2)
                ],
                if (widget.reply.platform == 'Android') ...[
                  const Icon(
                    Icons.android,
                    size: 16,
                    color: Color.fromRGBO(45, 223, 133, 100),
                  ),
                ],
                if (widget.reply.platform == 'iPhone') ...[
                  const Icon(Icons.apple, size: 16),
                ]
              ],
            ),
          ],
        )
      ],
    );
  }
}
