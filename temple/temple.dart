import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

final FeedTemplate defaultFeed = FeedTemplate(
  content: Content(
    title: '오케어 보호자 초대 메시지',
    description: '#오케어 #테스트',
    imageUrl: Uri.parse(
        'https://cdn-icons-png.flaticon.com/512/1694/1694125.png'
    ),
    link: Link(
        webUrl: Uri.parse('https://developers.kakao.com'),
        mobileWebUrl: Uri.parse('https://developers.kakao.com')),
  ),
  itemContent: ItemContent(
    profileText: 'Kakao',
    profileImageUrl: Uri.parse(
        'https://cdn-icons-png.flaticon.com/512/1694/1694125.png'),
    titleImageUrl: Uri.parse(
        'https://cdn-icons-png.flaticon.com/512/1694/1694125.png'),
    titleImageText: '오케어 보호자 초대',
    titleImageCategory: 'health',
    // items: [
    //   ItemInfo(item: '', itemOp: ''),
    // ],
    // sum: 'total',
    // sumOp: '15000원',
  ),
  // social: Social(likeCount: 286, commentCount: 45, sharedCount: 845),
  buttons: [
    Button(
      title: '웹으로 보기',
      link: Link(
        webUrl: Uri.parse('https: //developers.kakao.com'),
        mobileWebUrl: Uri.parse('https: //developers.kakao.com'),
      ),
    ),
    Button(
      title: '앱으로보기',
      link: Link(
        androidExecutionParams: {'key1': 'value1', 'key2': 'value2'},
        iosExecutionParams: {'key1': 'value1', 'key2': 'value2'},
      ),
    ),
  ],
);
