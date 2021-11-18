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

//단소 설명 페이지안에서의 내용
//단소의 역사 설명
const String HISTORY =
    '단소의 역사관한설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명';
const String SUBHISTORY = '단소의 역사추가 설명';
//평조 설명
const String PDANSO = '평조 단소 설명을 적어주세요';
//경제 설명
const String KDANSO = '경제 단소 설명을 적어주세요';
//향조 설명
const String HDANSO = '향조 단소 설명을 적어주세요';
//단소잡는부분 설명
const String DANSO_CATCH =
    '단소 운지법, 율명, 악기 잡는 법, 중임무황태의 기본적인 소리내는 방법에 관한 영상입니다.';
const String DANSO_CATCH2 =
    '단소 소리를 처음 내보려고 하는 학생들을 위한 영상으로단소 소리 내기에 관한 기초적이면서도 중요한 내용입니다.';
const String DANSO_CATCH_TITLE = '단소의 기본';
const String DANSO_CATCH2_TITLE = '단소 기초 소리 내기';

const String DANSO_SUBCATCH = '단소잡는부분을 설명을 적어주세요';
//단소연주자세 설명
const String PALYPOS = '단소연주자세의 설명을 적어주세요';
//입술모양 설명
const String SOUND =
    '단소라는 악기는 음정을 유지하기가 상당히 힘듭니다. 이 악기의 소리를 크게 또는 작게 불되 음정을 맞추는 방법을 익혀봅시다.';
const String SOUND_TITLE = '단소 소리조절';
const String SOUND_HL = '단소에서 높은 음, 낮은 음이 잘 안나는 학생들을 위한 영상입니다.';
const String SOUND_HL_TITLE = '단소 소리 높낮이';
//호흡식 설명
const String BREATH =
    '단소 소리가 여전히 안 나는 학생들을 위한 영상입니다.입술위치, 떠는 소리 내는 법, 호흡법과 관련된 내용이 담겨있습니다.';
const String BREATH_TITLE = '단소 호흡법';
const String BREATH2 =
    '단소를 불다 보면 호흡에 문제가 생겨서 완주하는데 어려움을 겪는분들이 많습니다. 그런 분들을 위한 장기적인 호흡 연습 방법에 관한내용입니다.';
const String BREATH2_TITLE = '복식호흡';
//율명 설명
const String SHEET = '율명의 설명을 적어주세요';
const String SUBSHEET = '율명의 추가 설명을 적어주세요';

//단소메인페이지 내용
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
const String DANSO_HISTORY_URL = 'Fc9fVi-_DWE';
const String P_DANSO_URL = '_epwxDTxa3A';
const String K_DANSO_URL = 'DyRm_Hxy0xo';
const String H_DANSO_URL = '5KLsjhz9jMI';
const String DANSO_PALYPOS_URL = 'bVE1E7FLhS4';
//
const String DANSO_LIPS_URL = 'Cuc3e0v1Dc0';
const String DANSO_LIPS2_URL = 'aoqaQKH3iZg';
const String DANSO_BREATH_URL = 'opQtzo9zXJE';
const String DANSO_BREATH2_URL = 'k-PYlJKY8Uc';
const String DANSO_SOUND_URL = 'CIBSc8cgUu0';
const String DANSO_SOUND_HL_URL = 'CIBSc8cgUu0';

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
//에셋(assets) 가져오기
const List<String> DANSO_SVG_LIST = [
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg',
  'assets/images/ic_danso.svg'
];
const String HOME_SVG = 'assets/images/ic_home.svg';
const String BOLW_SVG = 'assets/images/ic_blow.svg';
const String LOGO_SVG = 'assets/images/ic_logo.svg';
const String SUCCESS_SVG = 'assets/images/ic_success.svg';
const String FAIL_SVG = 'assets/images/ic_failure.svg';
const String WARNING_SVG = 'assets/images/ic_warning.svg';
const String SILVER_SVG = 'assets/images/ic_1_step.svg';
const String SILVER_LIST_SVG = 'assets/images/ic_1_turn.svg';
const String DANSO_TUNING_SVG = 'assets/images/mainImage/ic_danso_tuning.svg';
const String INFOR_SVG = 'assets/images/mainImage/ic_infor.svg';
const String QandA_SVG = 'assets/images/mainImage/ic_q&a.svg';
const String STUDY_SVG = 'assets/images/mainImage/ic_study.svg';
const String TUNE_SVG = 'assets/images/mainImage/ic_tune.svg';
const List TEAR_SVG_LIST = [
  'assets/images/tear/ic_unranked.svg',
  'assets/images/tear/ic_bronze.svg',
  'assets/images/tear/ic_silver.svg',
  'assets/images/tear/ic_gold.svg',
  'assets/images/tear/ic_platinum.svg',
  'assets/images/tear/ic_master.svg',
];

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
