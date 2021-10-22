import 'package:flutter/material.dart';
import 'package:danso_function/danso_function.dart';

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

//메인색깔
const Color mainColor = Color(0xffEFBE50);
//carousel 색깔
const Color second = Color(0xffE39D00);
//텝바 색깔 연한갈색
const Color tapBarColor = Color(0xffC48535);
//마이페이지 글자색
const Color white = Color(0xffFFFFFF);

const Color graBlackColor = Color(0xff9D9D9D);
const Color graWeithColor = Color(0xffD6D6D6);
const Color graLightColor = Color(0xffECECEC);

//어플리캐이션 기본 크기 설정

const double basicPadding = 15;
const double stylePadddig = 17;
const double stepByStepPadding = 28;
const double appBarHeight = 50;

//글자 크기 사이즈
//작은 사이즈
const double textSmallSize = 12;
//기본
const double textBasicSize = 14;
//부제목
const double textContantSize = 17;
//
const double textStyleSize = 18;
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

const double jonWidth = 62;
const double jonHeight = 35;
const double jonListWidth = 61;
const double jonListHeight = 120;

// 단소 스타일 가이드
const Color third = Color(0xffc48535);
const Color force = Color(0xff7E531D);

//단소 설명 페이지안에서의 내용
//단소의 역사 설명
const String HISTORY =
    "단소의 역사관한설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명";
const String SUBHISTORY = "단소의 역사추가 설명";
//평조 설명
const String PDANSO = "평조 단소 설명을 적어주세요";
//경제 설명
const String KDANSO = "경제 단소 설명을 적어주세요";
//향조 설명
const String HDANSO = "향조 단소 설명을 적어주세요";
//단소잡는부분 설명
const String DANSO_CATCH = "단소잡는부분을 설명을 적어주세요";
const String DANSO_SUBCATCH = "단소잡는부분을 설명을 적어주세요";
//단소연주자세 설명
const String PALYPOS = "단소연주자세의 설명을 적어주세요";
//입술모양 설명
const String LIPS = "입술모양의 설명을 적어주세요";
//호흡식 설명
const String BREATH = "호흡식의 설명을 적어주세요";
//율명 설명
const String SHEET = "율명의 설명을 적어주세요";
const String SUBSHEET = "율명의 추가 설명을 적어주세요";

//단소메인페이지 내용
//단소알아보기 설명
const String LOOK = "단소의 역사, 종류에 대해 알아볼까요?";
//운지법 익히기 설명
const String LEARN = "기초적인 단소의 운지법을 연습해 보아요.";
//연주곡 익히기 설명
const String PLAYLEARN = "전통곡들을 단소로 연습하여 피드백 받으세요.";
//질문하기 설명
const String QUESTIONS = "단소에 대해 궁금하거나 어려움이 있다면 질문해보세요. ";

//단소의 역사
//youtube URL style
const double youtubeWidth = 360;
const double youtubeHeight = 250;
const String DANSO_HISTORY_URL = "Fc9fVi-_DWE";
const String P_DANSO_URL = "_epwxDTxa3A";
const String K_DANSO_URL = "DyRm_Hxy0xo";
const String H_DANSO_URL = "5KLsjhz9jMI";
const String DANSO_PALYPOS_URL = "bVE1E7FLhS4";
const String DANSO_LIPS_URL = "lcg6wekmCRA";
const String DANSO_BREATH_URL = "ToxQLPErpKI";
const String DANSO_SHEET_URL = "LBmB3DGxnNk";

//1~5단계 연습 리스트
// YulmyeongNote(Yulmyeong.tae,ScaleStatus.origin));//  율명하고 스캐일맞으면 참거짓 판명을해준다
const List level1 = [
  '汰',
  "",
  "",
  '汰',
  "",
  "汰",
  "汰",
  "汰",
  "汰",
  "汰",
  "",
  "△",
  "汰",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "汰",
  "",
  "△",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "△",
  "汰",
  "",
  "",
  "汰",
  "",
  "",
  "汰",
  "",
  "",
  "汰",
  "",
  "△"
];
const level2 = [
  "無",
  "無",
  "潢",
  "潢",
  "",
  "△",
  "汰",
  "",
  "汰",
  "汰",
  "",
  "△",
  "潢",
  "汰",
  "汰",
  "潢",
  "",
  "△",
  "汰",
  "汰",
  "潢",
  "無",
  "",
  "△",
  "汰",
  "潢",
  "無",
  "潢",
  "汰",
  "△",
  "無",
  "潢",
  "汰",
  "潢",
  "無",
  "△",
  "汰",
  "",
  "",
  "潢",
  "",
  "",
  "無",
  "",
  "",
  "潢",
  "",
  "△",
];
const level3 = [
  "無",
  "無",
  "潢",
  "潢",
  "汰",
  "汰",
  "㳞",
  "㳞",
  "淋",
  "淋",
  "",
  "△",
  "無",
  "潢",
  "汰",
  "㳞",
  "淋",
  "△",
  "淋",
  "㳞",
  "汰",
  "潢",
  "無",
  "△",
  "汰",
  "㳞",
  "淋",
  "㳞",
  "汰",
  "潢",
  "無",
  "潢",
  "汰",
  "",
  "",
  "△",
  "汰",
  "潢",
  "無",
  "潢",
  "汰",
  "㳞",
  "淋",
  "㳞",
  "汰",
  "",
  "",
  "△"
];
const level4 = [
  "仲",
  "仲",
  "林",
  "林",
  "無",
  "無",
  "潢",
  "汰",
  "㳞",
  "淋",
  "",
  "△",
  "仲",
  "林",
  "無",
  "潢",
  "汰",
  "△",
  "㳞",
  "淋",
  "㳞",
  "汰",
  "潢",
  "△",
  "潢",
  "汰",
  "㳞",
  "淋",
  "㳞",
  "汰",
  "潢",
  "無",
  "林",
  "仲",
  "",
  "△",
  "潢",
  "無",
  "林",
  "仲",
  "林",
  "無",
  "潢",
  "汰",
  "㳞",
  "淋",
  "",
  "△"
];
const level5 = [
  "淋",
  "潕",
  "㶂",
  "潕",
  "㶂",
  "㳲",
  "㶂",
  "潕",
  "淋",
  "㳞",
  "",
  "△",
  "仲",
  "林",
  "無",
  "林",
  "無",
  "潢",
  "汰",
  "㳞",
  "淋",
  "潕",
  "",
  "△",
  "淋",
  "潕",
  "㶂",
  "㳲",
  "",
  "△",
  "㳲",
  "㶂",
  "潕",
  "淋",
  "㳞",
  "△",
  "汰",
  "潢",
  "無",
  "林",
  "仲",
  "△",
  "仲",
  "林",
  "無",
  "潢",
  "汰",
  "㳞"
];
