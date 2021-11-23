import 'package:flutter/material.dart';

// 배경색

const Color background = Color(0xffFAF1E6);

const Color backgroundGary = Color(0xffECECEC);

// 매우 어두운 회색(상단 탭 텍스트-선택됨)
const Color ultraDarkGray = Color(0xff636363);

// 어두운 회색(상단 탭 인디케이터-선택됨)
const Color darkGray = Color(0xffA5A5A5);

// 중간 밝기 회색
const Color mediumGray = Color(0xff949494);

// 밝은 회색(상단 탭 텍스트-선택 안됨, 상단 탭 인디케이터-선택 안됨)
const Color lightGray = Color(0xffD4D4D4);

// 페이지 인디케이터 어두운 회색
const Color indiDarkGray = Color(0xff878787);

// 페이지 인디케이터 밝은 회색
const Color indiLightGray = Color(0xffCFCFCF);
//빨간색

//메인색깔
const Color mainColor = Color(0xffEFBE50);
const Color expColor = Color(0xffFCDF9C);
const Color buttonColorYellow = Color(0xffFFB85E);
const Color graColorYellow = Color(0xffFFFBDE);

//carousel 색깔
const Color second = Color(0xffE39D00);
//텝바 색깔 연한갈색
const Color tapBarColor = Color(0xffC48535);
//마이페이지 글자색
const Color white = Color(0xffFFFFFF);

const Color grayBlackColor = Color(0xff9D9D9D);
const Color grayWeithColor = Color(0xffD6D6D6);
const Color grayLightColor = Color(0xffECECEC);

//어플리캐이션 기본 크기 설정
const double eightPadding = 8;
const double basicPadding = 15;
const double svenPadddig = 17;
const double iconPadding = 30;
const double stepByStepPadding = 28;
const double appBarHeight = 50;

//글자 크기 사이즈
//작은 사이즈
const double textSmallSize = 12;
//기본
const double textBasicSize = 14;
//부제목
const double textFiveSize = 15;
const double textSixSize = 16;
const double textSevenSize = 17;

//
const double textEightSize = 18;
//타이틀
const double textTitleSize = 20;
//단일크기
const double textSingleSize = 23;

//글자 색상
//진한 검은색
const Color textDarkBlack = Color(0xff0c0c0c);
// 검은색
const Color textBlack = Color(0xff222222);
//비활성화 회색
const Color textHiddenGray = Color(0xffBFBFBF);

//정간보세로,가로
const FontWeight bold = FontWeight.bold;

const double jungWidth = 62;
const double jungHeight = 35;
const double jungSixHeight = 82;
const double jungEightHeight = 62;

// 단소 스타일 가이드
const Color third = Color(0xffc48535);
const Color appBarColor = Color(0xff302414);
const Color logoColor = Color(0xffEFBE50);
const Color buttonColorOrang = Color(0xffF19929);
const Color unButtonColorOrang = Color(0xffFEC782);
const Color matchColor = Color(0xff00A8F2);
const Color unMatchColor = Color(0xffFE0000);
const Color leftColor = Color(0xffE6C387);
const Color unSelectColor = Color(0xffFBCF98);

//단소 설명 페이지안에서의 내용
//단소의 역사 설명
const String HISTORY =
    '단소가 역사책에 기록된 것은 그렇게 오래 되지 않았지만, 조상들의 삶 속에서 널리 연주되었던 악기 입니다.';
const String HISTORY_TITLE = '단소의 역사';
//평조 설명
const String DANSO_KIND =
    '단소는 경제단소와 평조단소로 나누어 집니다. 경제단소는 표준으로 사용하는 단소이고, 평조단소는 경제단소보다 길고 전체적으로 음정이4도 낮습니다.';
const String DANSO_KIND_TITLE = '단소의  종류';

const String DANSO_PALY =
    '단소를 연주할 때  운지법(손가락 사용법)의 유의사항을 알아보고, 올바른 방법으로  연주 해 봅시다.';

const String DANSO_PALY_TITLE = '단소 연주시 운지법';

const String DANSO_UNM =
    '단소를 잘 불기 위해서는 입김의 세기, 양, 속도를 어떻게 해야 하는지 알아 봅시다. 단소의 음들을 어떻게 분류할 수 있는지 알아 보고 연주 해 봅시다.';

const String DANSO_UNM_TITLE = '단소 음의 성질';

const String DANSO_SAME_UNM =
    '단소 연주를 할 때, 같은 음이 반복되는 경우가 있습니다. 입김을 끊어서 연주 하지 않으면서 같은 음을 구분하여 연주 하는 방법을 익혀 봅시다.';

const String DANSO_SAME_UNM_TITLE = '단소의 동일음 주법';

const String DANSO_UNM_TEST =
    '단소 연주를 잘 하기 위해 연습하는 방법을 알아 봅시다. 차례가기, 두음 뛰어 가기, 옥타브 연습 등 여러 가지 방법으로 연습 해 봅시다.';

const String DANSO_UNM_TEST_TITLE = '단소음 연습 방법';

//단소잡는부분 설명
const String DANSO_CATCH =
    '단소 운지법, 율명, 악기 잡는 법, 중임무황태의 기본적인 소리내는 방법에 관한 영상입니다.';
const String DANSO_CATCH2 =
    '단소 소리를 처음 내보려고 하는 학생들을 위한 영상으로단소 소리 내기에 관한 기초적이면서도 중요한 내용입니다.';
const String DANSO_CATCH_TITLE = '단소의 기본';
const String DANSO_CATCH2_TITLE = '단소 기초 소리 내기';

//단소연주자세 설명

const String SOUND =
    '단소라는 악기는 음정을 유지하기가 상당히 힘듭니다. 이 악기의 소리를 크게 또는 작게 불되 음정을 맞추는 방법을 익혀봅시다.';
const String SOUND_TITLE = '단소 소리조절';
const String SOUND_HL = '단소에서 높은 음, 낮은 음이 잘 안나는 학생들을 위한 영상입니다.';
const String SOUND_HL_TITLE = '단소 소리 높낮이';
const String BREATH =
    '단소 소리가 여전히 안 나는 학생들을 위한 영상입니다.입술위치, 떠는 소리 내는 법, 호흡법과 관련된 내용이 담겨있습니다.';
const String BREATH_TITLE = '단소 호흡법';
const String BREATH2 =
    '단소를 불다 보면 호흡에 문제가 생겨서 완주하는데 어려움을 겪는분들이 많습니다. 그런 분들을 위한 장기적인 호흡 연습 방법에 관한내용입니다.';
const String BREATH2_TITLE = '복식호흡';

//단소 메인페이지 내용
//단소알아보기 설명
const String LOOK = '단소의 역사, 종류에 대해 알아볼까요?';
//운지법 익히기 설명
const String LEARN = '기초적인 단소의 운지법을 연습해 보아요.';
//연주곡 익히기 설명
const String PLAYLEARN = '전통곡들을 단소로 연습하여 피드백 받으세요.';
//질문하기 설명
const String QUESTIONS = '단소에 대해 궁금하거나 어려움이 있다면 질문해보세요. ';
//기준은잡기
const String VOLUMECONTROL = '단소를 불기 전에 필수로 소리를 맞춰보아요.';

//단소의 역사
//youtube URL style
const double youtubeWidth = 360;
const double youtubeHeight = 250;
const String DANSO_HISTORY_URL = 'j_XrCCOwBe8';
const String DANSO_KIND_URL = 'AvH2NGdYLjk';
const String DANSO_PALY_URL = 'hogSau50f64';
const String DANSO_UNM_URL = 'rg5oT4VLA14';
const String DANSO_SAME_UNM_TITLE_URL = 'o8MulHBatrM';
const String DANSO_UNM_TEST_URL = 'C-utyYK-FDI';
//아래쪽은 선생님들url
const String DANSO_LIPS_URL = 'Cuc3e0v1Dc0';
const String DANSO_LIPS2_URL = 'aoqaQKH3iZg';
const String DANSO_BREATH_URL = 'opQtzo9zXJE';
const String DANSO_BREATH2_URL = 'k-PYlJKY8Uc';
const String DANSO_SOUND_URL = 'CIBSc8cgUu0';
const String DANSO_SOUND_HL_URL = 'GiFWeblNJc8';

//1~5단계 연습 리스트
// YulmyeongNote(Yulmyeong.tae,ScaleStatus.origin));//  율명하고 스캐일맞으면 참거짓 판명을해준다

const String level1 =
    "t|o|o#t|o|o#t|o|o#t|o|^#t|o|t#t|o|t#t|o|t#t|o|^#t|t|o#t|t|o#t|t|o#t|o|^#t|o|o#t|o|t#t|t|t#t|o|^#";
const String level2 =
    "t|o|o#h|o|o#m|o|o#h|o|^#t|h|m#h|t|^#m|h|t#h|m|^#h|t|t#h|o|^#t|t|h#m|o|^#m|m|h#h|o|^#t|o|t#t|o|^#";
const String level3 =
    "t|h|m#h|t|J#Y|J|t#o|o|^#t|J|Y#J|t|h#m|h|t#o|o|^#m|h|t#J|Y|^#Y|J|t#h|m|^#m|m|h#h|t|t#J|J|Y#Y|o|^#";
const String level4 =
    "h|m|y#j|y|m#h|t|J#Y|o|^#h|t|J#Y|J|t#h|m|y#j|o|^#j|y|m#h|t|^#J|Y|J#t|h|^#j|j|y#y|m|m#h|t|J#Y|o|^#";
const String level5 =
    "t|h|m#y|j|^#j|y|m#h|t|J#Y|M|H#T|o|^#T|H|M#Y|J|^#j|y|m#y|m|h#t|J|Y#M|o|^#Y|M|H#M|H|T#H|M|Y#J|o|^#";
// 배경음
const String backMusic = 'assets/music/danso_arirang_mixed.mp3';
//에셋(assets) 가져오기
const List<String> DANSO_SVG_LIST = [
  'assets/images/danso_code/ic_jung.svg',
  'assets/images/danso_code/ic_lim.svg',
  'assets/images/danso_code/ic_mu.svg',
  'assets/images/danso_code/ic_hwang.svg',
  'assets/images/danso_code/ic_tea.svg',
  'assets/images/danso_code/ic_jung.svg',
  'assets/images/danso_code/ic_lim.svg',
  'assets/images/danso_code/ic_mu.svg',
  'assets/images/danso_code/ic_hwang.svg',
  'assets/images/danso_code/ic_tea.svg',
];
//main svg 기준음잡디 메인페이지 아이콘
const String HOME_SVG = 'assets/images/ic_home.svg';
const String BOLW_SVG = 'assets/images/ic_blow.svg';
const String LOGO_SVG = 'assets/images/ic_logo.svg';
const String SUCCESS_SVG = 'assets/images/ic_success.svg';
const String FAIL_SVG = 'assets/images/ic_failure.svg';
const String WARNING_SVG = 'assets/images/ic_warning.svg';
const String MAIN_ILL1_SVG = 'assets/images/mainImage/main_illeoseuteu(1).svg';
const String MAIN_ILL2_SVG = 'assets/images/mainImage/main_illeoseuteu(2).svg';
const String ON_SVG = 'assets/images/mainImage/ic_on.svg';
const String OFF_SVG = 'assets/images/mainImage/ic_off.svg';
//마이 페이지 아이콘
const String BOOKMARK_SVG = 'assets/images/my_page/ic_bookmark.svg';
const String GRAPH_SVG = 'assets/images/my_page/ic_graph.svg';
const String MP3_SVG = 'assets/images/my_page/ic_mp3.svg';
const String MY_MUSIC_SVG = 'assets/images/my_page/ic_my_music.svg';
const String PLAY_STOP_SVG = 'assets/images/my_page/ic_play_stop.svg';
const String PLAY_SVG = 'assets/images/my_page/ic_play.svg';
const String MY_RECORD_SVG = 'assets/images/my_page/ic_my_record.svg';
const String SEE_MORE_SVG = 'assets/images/my_page/ic_see_more.svg';
const String VIDEO_SVG = 'assets/images/my_page/ic_video.svg';
//녹음 녹화 아이콘
const String RECORD_SVG = 'assets/images/ic_record.svg';
const String TRANSCRIPTION_SVG = 'assets/images/ic_transcription.svg';

//연주곡 익히기부분
const List STEP_SVG = [
  "",
  'assets/images/step/ic_step_1.svg',
  'assets/images/step/ic_step_2.svg',
  'assets/images/step/ic_step_3.svg',
  'assets/images/step/ic_step_4.svg',
];
const List COUNT_LIST_SVG = [
  'assets/images/step/ic_music_list_1.svg',
  'assets/images/step/ic_music_list_2.svg',
  'assets/images/step/ic_music_list_3.svg',
  'assets/images/step/ic_music_list_4.svg',
  'assets/images/step/ic_music_list_5.svg',
  'assets/images/step/ic_music_list_6.svg',
  'assets/images/step/ic_music_list_7.svg',
];
//노래끝난후 축하부분
const List STAR_SVG = [
  'assets/images/star/ic_star_1.svg',
  'assets/images/star/ic_star_2.svg',
  'assets/images/star/ic_star_3.svg',
];
//메인 아이콘

const String DANSO_TUNING_SVG = 'assets/images/mainImage/ic_danso_tuning.svg';
const String INFOR_SVG = 'assets/images/mainImage/ic_infor.svg';
const String QandA_SVG = 'assets/images/mainImage/ic_q&a.svg';
const String STUDY_SVG = 'assets/images/mainImage/ic_study.svg';
const String TUNE_SVG = 'assets/images/mainImage/ic_tune.svg';
//티어별 svg
const List TEAR_SVG_LIST = [
  'assets/images/tear/ic_unranked.svg',
  'assets/images/tear/ic_bronze.svg',
  'assets/images/tear/ic_silver.svg',
  'assets/images/tear/ic_gold.svg',
  'assets/images/tear/ic_platinum.svg',
  'assets/images/tear/ic_master.svg',
];

const List TEAR_NAME = [
  '단소 입문자',
  '단소 초급자',
  '단소 중급자',
  '단소 상급자',
  '단소 숙련자',
  '단소 마스터',
];
//질문하기 페이지 부분
const List Q_AND_A_SUB_CONTANT = [
  '[🐰단소5탄] 단소 소리가 났다 안났다 해요 / 집에선 잘 되는데학교에선 안나요 / 입술 모양을 잘 모르겠어요 / 각도가 헷갈려요',
  '모든 손가락을 다 뗀 운지(태)는 소리가 잘 나는데 구먹을 막으면 소리가 안 나는 학생들을 위한 교육 내용을 담은 영상입니다',
  '단소 소리가 맑지 않아서 고민이 많은 분들이 많습니다. 이번 영상은 악기 소리를 보다 깔끔하게 낼 수 있는 방법에 관한 내용입니다.',
  '곡 연주를 위한 매일 연습 팁을 담은 영상입니다. 여러 음을 연결하는 연습 방법에 관한 내용인데, 이 부분을 꾸준히 연습하면 보다 부드러운 소리로 아름다운 음악을 만드는 데 도움이 될 것입니다.',
  '단소 소리는 나기 시작했는데, 소리가 유지가 안 되는 학생들을  위한 영상입니다. 유지가 되지 않는 원인을 찾고, 함께 해결해봅시다.',
];
const List Q_AND_A_URL = [
  'PBAZnJNcYVY',
  'z2afsvDPhd8',
  '4U_cOC6f66A',
  'EghU5mA8KTw',
  'JHVGwgMXfAo',
];
const List Q_AND_A_TITLE = [
  '단소 소리가 안나요',
  '단소 구멍을 막으면 소리가 안나요',
  '맑은 소리를 내고싶어요!',
  '매일 매일 연습하려면 어떻게 해야하나요?',
  '복식호흡 유지를 어떻게 하나요?'
];
const List Q_AND_A_TIME = [0.0, 0.0, 0.0, 0.0, 0.0];

enum SongSpeed { eight, nine, ten, eleven, twelve }
