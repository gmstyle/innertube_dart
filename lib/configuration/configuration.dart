import 'package:innertube_dart/models/client_context.dart';
import 'package:innertube_dart/models/config.dart';

const REFERER_YOUTUBE = 'https://www.youtube.com/';
const REFERER_YOUTUBE_MOBILE = 'https://m.youtube.com/';
const REFERER_YOUTUBE_MUSIC = 'https://music.youtube.com/';
const REFERER_YOUTUBE_KIDS = 'https://www.youtubekids.com/';
const REFERER_YOUTUBE_STUDIO = 'https://studio.youtube.com/';
const REFERER_YOUTUBE_ANALYTICS = 'https://analytics.youtube.com/';
const REFER_GOOGLE_ASSISTANT = 'https://assistant.google.com/';

const USER_AGENT_WEB =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36';
const USER_AGENT_ANDROID =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Mobile Safari/537.36';
const USER_AGENT_IOS =
    'Mozilla/5.0 (iPhone; CPU iPhone OS 15_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/98.2  Mobile/15E148 Safari/605.1.15';
const USER_AGENT_TV_HTML5 =
    'Mozilla/5.0 (PlayStation 4 5.55) AppleWebKit/601.2 (KHTML, like Gecko)';
const USER_AGENT_TV_APPLE =
    'AppleCoreMedia/1.0.0.12B466 (Apple TV; U; CPU OS 8_1_3 like Mac OS X; en_us)';
const USER_AGENT_TV_ANDROID =
    'Mozilla/5.0 (Linux; Android 5.1.1; AFTT Build/LVY48F; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/49.0.2623.10';
const USER_AGENT_XBOX_ONE =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10553';

const USER_AGENT_GOOGLE_ASSISTANT =
    'Mozilla/5.0 (Linux; Android 11; Pixel 2; DuplexWeb-Google/1.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Mobile Safari/537.36';

final config =
    Config(baseUrl: 'https://youtubei.googleapis.com/youtubei/v1/', clients: [
  ClientContext(
      clientId: 1,
      clientName: 'WEB',
      clientVersion: '2.20230728.00.00',
      userAgent: USER_AGENT_WEB,
      referer: REFERER_YOUTUBE,
      apiKey: 'AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8'),
  ClientContext(
      clientId: 2,
      clientName: 'MWEB',
      clientVersion: '2.20211214.00.00',
      userAgent: USER_AGENT_ANDROID,
      referer: REFERER_YOUTUBE_MOBILE,
      apiKey: 'AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8'),
  ClientContext(
      clientId: 3,
      clientName: 'ANDROID',
      clientVersion: '17.13.3',
      userAgent: USER_AGENT_ANDROID,
      apiKey: 'AIzaSyA8eiZmM1FaDVjRy-df2KTyQ_vz_yYM39w'),
  ClientContext(
      clientId: 5,
      clientName: 'IOS',
      clientVersion: '17.14.2',
      userAgent: USER_AGENT_IOS,
      apiKey: 'AIzaSyB-63vPrdThhKuerbB2N_l7Kwwcxj6yUAc'),
  ClientContext(
      clientId: 7,
      clientName: 'TVHTML5',
      clientVersion: '7.20210224.00.00',
      userAgent: USER_AGENT_TV_HTML5,
      apiKey: 'AIzaSyDCU8hByM-4DrUqRUYnGn-3llEO78bcxq8'),
  ClientContext(
    clientId: 8,
    clientName: 'TVLITE',
    clientVersion: '2',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 10,
    clientName: 'TVANDROID',
    clientVersion: '1.0',
    userAgent: USER_AGENT_TV_ANDROID,
  ),
  ClientContext(
    clientId: 13,
    clientName: 'XBOXONEGUIDE',
    clientVersion: '1.0',
    userAgent: USER_AGENT_XBOX_ONE,
  ),
  ClientContext(
      clientId: 14,
      clientName: '21.06.103',
      clientVersion: '1.0',
      userAgent: USER_AGENT_ANDROID,
      apiKey: 'AIzaSyD_qjV8zaaUMehtLkrKFgVeSX_Iqbtyws8'),
  ClientContext(
      clientId: 15,
      clientName: 'IOS_CREATOR',
      clientVersion: '20.47.100',
      userAgent: USER_AGENT_IOS,
      apiKey: 'AIzaSyAPyF5GfQI-kOa6nZwO8EsNrGdEx9bioNs'),
  ClientContext(
      clientId: 16,
      clientName: 'TVAPPLE',
      clientVersion: '1.0',
      userAgent: USER_AGENT_TV_APPLE),
  ClientContext(
      clientId: 18,
      clientName: 'ANDROID_KIDS',
      clientVersion: '7.12.3',
      userAgent: USER_AGENT_ANDROID,
      apiKey: 'AIzaSyAxxQKWYcEX8jHlflLt2Qcbb-rlolzBhhk'),
  ClientContext(
    clientId: 19,
    clientName: 'IOS_KIDS',
    clientVersion: '5.42.2',
    userAgent: USER_AGENT_IOS,
    apiKey: 'AIzaSyA6_JWXwHaVBQnoutCv1-GvV97-rJ949Bc',
  ),
  ClientContext(
    clientId: 21,
    clientName: 'ANDROID_MUSIC',
    clientVersion: '5.01',
    userAgent: USER_AGENT_ANDROID,
    apiKey: 'AIzaSyAOghZGza2MQSZkY_zfZ370N-PUdXEo8AI',
  ),
  ClientContext(
    clientId: 23,
    clientName: 'ANDROID_TV',
    clientVersion: '2.16.032',
    userAgent: USER_AGENT_TV_ANDROID,
  ),
  ClientContext(
    clientId: 26,
    clientName: 'IOS_MUSIC',
    clientVersion: '4.16.1',
    userAgent: USER_AGENT_IOS,
    apiKey: 'AIzaSyBAETezhkwP0ZWA02RsqT1zu78Fpt0bC_s',
  ),
  ClientContext(
    clientId: 27,
    clientName: 'MWEB_TIER_2',
    clientVersion: '9.20220325',
    userAgent: USER_AGENT_ANDROID,
    referer: REFERER_YOUTUBE_MOBILE,
  ),
  ClientContext(
    clientId: 28,
    clientName: 'ANDROID_VR',
    clientVersion: '1.28.63',
    userAgent: USER_AGENT_ANDROID,
  ),
  ClientContext(
    clientId: 29,
    clientName: 'ANDROID_UNPLUGGED',
    clientVersion: '6.13',
    userAgent: USER_AGENT_ANDROID,
  ),
  ClientContext(
    clientId: 30,
    clientName: 'ANDROID_TESTSUITE',
    clientVersion: '1.9',
    userAgent: USER_AGENT_ANDROID,
  ),
  ClientContext(
    clientId: 31,
    clientName: 'WEB_MUSIC_ANALYTICS',
    clientVersion: '0.2',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_ANALYTICS,
  ),
  ClientContext(
    clientId: 33,
    clientName: 'IOS_UNPLUGGED',
    clientVersion: '6.13',
    userAgent: USER_AGENT_IOS,
  ),
  ClientContext(
    clientId: 38,
    clientName: 'ANDROID_LITE',
    clientVersion: '3.26.1',
    userAgent: USER_AGENT_ANDROID,
  ),
  ClientContext(
    clientId: 39,
    clientName: 'IOS_EMBEDDED_PLAYER',
    clientVersion: '2.3',
    userAgent: USER_AGENT_IOS,
  ),
  ClientContext(
    clientId: 41,
    clientName: 'WEB_UNPLUGGED',
    clientVersion: '1.20220403',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE,
  ),
  ClientContext(
    clientId: 42,
    clientName: 'WEB_EXPERIMENTS',
    clientVersion: '1',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE,
  ),
  ClientContext(
    clientId: 43,
    clientName: 'TVHTML5_CAST',
    clientVersion: '1.1',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 55,
    clientName: 'ANDROID_EMBEDDED_PLAYER',
    clientVersion: '17.13.3',
    userAgent: USER_AGENT_ANDROID,
    apiKey: 'AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8',
  ),
  ClientContext(
    clientId: 56,
    clientName: 'WEB_EMBEDDED_PLAYER',
    clientVersion: '1.20220413.01.00',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE,
    apiKey: 'AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8',
  ),
  ClientContext(
    clientId: 57,
    clientName: 'TVHTML5_AUDIO',
    clientVersion: '2.0',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 58,
    clientName: 'TV_UNPLUGGED_CAST',
    clientVersion: '0.1',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 59,
    clientName: 'TVHTML5_KIDS',
    clientVersion: '3.20220325',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 60,
    clientName: 'WEB_HEROES',
    clientVersion: '0.1',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE,
  ),
  ClientContext(
    clientId: 61,
    clientName: 'WEB_MUSIC',
    clientVersion: '1.0',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_MUSIC,
  ),
  ClientContext(
    clientId: 62,
    clientName: 'WEB_CREATOR',
    clientVersion: '1.20210223.01.00',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_STUDIO,
    apiKey: 'AIzaSyBUPetSUmoZL-OhlxA7wSac5XinrygCqMo',
  ),
  ClientContext(
    clientId: 63,
    clientName: 'TV_UNPLUGGED_ANDROID',
    clientVersion: '1.22.062.06.90',
    userAgent: USER_AGENT_TV_ANDROID,
  ),
  ClientContext(
    clientId: 64,
    clientName: 'IOS_LIVE_CREATION_EXTENSION',
    clientVersion: '17.13.3',
    userAgent: USER_AGENT_IOS,
  ),
  ClientContext(
    clientId: 65,
    clientName: 'TVHTML5_UNPLUGGED',
    clientVersion: '6.13',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 66,
    clientName: 'IOS_MESSAGES_EXTENSION',
    clientVersion: '16.20',
    userAgent: USER_AGENT_IOS,
    apiKey: 'AIzaSyDCU8hByM-4DrUqRUYnGn-3llEO78bcxq8',
  ),
  ClientContext(
    clientId: 67,
    clientName: 'WEB_REMIX',
    clientVersion: '1.20230724.00.00',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_MUSIC,
    apiKey: 'AIzaSyC9XL3ZjWddXya6X74dJoCTL-WEYFDNX30',
  ),
  ClientContext(
    clientId: 68,
    clientName: 'IOS_UPTIME',
    clientVersion: '1.0',
    userAgent: USER_AGENT_IOS,
  ),
  ClientContext(
    clientId: 69,
    clientName: 'WEB_UNPLUGGED_ONBOARDING',
    clientVersion: '0.1',
    userAgent: USER_AGENT_WEB,
  ),
  ClientContext(
    clientId: 70,
    clientName: 'WEB_UNPLUGGED_OPS',
    clientVersion: '0.1',
    userAgent: USER_AGENT_WEB,
  ),
  ClientContext(
    clientId: 71,
    clientName: 'WEB_UNPLUGGED_PUBLIC',
    clientVersion: '0.1',
    userAgent: USER_AGENT_WEB,
  ),
  ClientContext(
    clientId: 72,
    clientName: 'TVHTML5_VR',
    clientVersion: '0.1',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 74,
    clientName: 'ANDROID_TV_KIDS',
    clientVersion: '1.16.80',
    userAgent: USER_AGENT_TV_ANDROID,
  ),
  ClientContext(
    clientId: 75,
    clientName: 'TVHTML5_SIMPLY',
    clientVersion: '1.0',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 76,
    clientName: 'WEB_KIDS',
    clientVersion: '2.20220414.00.00',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_KIDS,
    apiKey: 'AIzaSyBbZV_fZ3an51sF-mvs5w37OqqbsTOzwtU',
  ),
  ClientContext(
    clientId: 77,
    clientName: 'MUSIC_INTEGRATIONS',
    clientVersion: '0.1',
  ),
  ClientContext(
    clientId: 80,
    clientName: 'TVHTML5_YONGLE',
    clientVersion: '0.1',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 84,
    clientName: 'GOOGLE_ASSISTANT',
    clientVersion: '0.1',
    userAgent: USER_AGENT_GOOGLE_ASSISTANT,
  ),
  ClientContext(
    clientId: 85,
    clientName: 'TVHTML5_SIMPLY_EMBEDDED_PLAYER',
    clientVersion: '2.0',
    userAgent: USER_AGENT_TV_HTML5,
  ),
  ClientContext(
    clientId: 87,
    clientName: 'WEB_INTERNAL_ANALYTICS',
    clientVersion: '0.1',
    userAgent: USER_AGENT_WEB,
    referer: REFERER_YOUTUBE_ANALYTICS,
  ),
  ClientContext(
    clientId: 88,
    clientName: 'WEB_PARENT_TOOLS',
    clientVersion: '1.20220403',
    userAgent: USER_AGENT_WEB,
  ),
  ClientContext(
    clientId: 89,
    clientName: 'GOOGLE_MEDIA_ACTIONS',
    clientVersion: '0.1',
    userAgent: USER_AGENT_GOOGLE_ASSISTANT,
  ),
  ClientContext(
    clientId: 90,
    clientName: 'WEB_PHONE_VERIFICATION',
    clientVersion: '1.0.0',
    userAgent: USER_AGENT_WEB,
  ),
  ClientContext(
    clientId: 92,
    clientName: 'IOS_PRODUCER',
    clientVersion: '0.1',
    userAgent: USER_AGENT_IOS,
  ),
  ClientContext(
    clientId: 93,
    clientName: 'TVHTML5_FOR_KIDS',
    clientVersion: '7.20220325',
    userAgent: USER_AGENT_TV_HTML5,
  ),
]);
