# 🚂 Flutter Train App

## 📱 소개

Flutter Train App은 열차 예매 서비스를 제공하는 모바일 애플리케이션입니다. 사용자는 출발역과 도착역을 선택하고 원하는 좌석을 예약할 수 있습니다.

## ✨ 주요 기능

- 🏠 홈 화면: 출발역과 도착역 선택
- 🚉 역 리스트: 모든 가능한 역 표시 및 검색
- 🎟️ 좌석 선택: 시각적인 좌석 배치도를 통한 좌석 선택
- 🌓 다크 모드 지원: 사용자 친화적인 UI/UX

## 🛠️ 기술 스택

- Framework: Flutter
- 언어: Dart
- 상태 관리: StatefulWidget
- UI 디자인: Material Design & Cupertino

## 📂 프로젝트 구조

```
lib/
├── main.dart         # 앱 진입점
├── core/             # 핵심 유틸리티 및 공통 함수
├── data/             # 데이터 모델 및 서비스
└── pages/            # 화면 및 위젯
    ├── home_page.dart
    ├── seat_page.dart
    ├── station_list_page.dart
    └── widgets/      # 재사용 가능한 위젯
        ├── common_button.dart
        ├── home/
        ├── list/
        └── seat/
```

## 🚀 시작하기

1. Flutter 개발 환경 설정
2. 저장소 클론
   ```
   git clone https://github.com/username/flutter_train_app.git
   ```
3. 의존성 설치
   ```
   flutter pub get
   ```
4. 앱 실행
   ```
   flutter run
   ```

## 🎨 스크린샷

(스크린샷 이미지 추가 공간)

## 🔍 주요 기능 설명

### 🏠 홈 화면
- 출발역과 도착역을 선택할 수 있는 직관적인 인터페이스
- 테마 전환 버튼으로 라이트/다크 모드 전환 가능

### 🚉 역 리스트
- 역 검색 기능 지원
- 빠른 역 선택을 위한 리스트 제공

### 🎟️ 좌석 선택
- 시각적인 좌석 배치도
- 선택한 좌석 강조 표시
- 예매 확인 프로세스

## 📝 라이센스

MIT © [Your Name]

---

📅 마지막 업데이트: 2024년 4월
