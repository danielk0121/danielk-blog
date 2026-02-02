## 참고
- 블로그 url : https://danielk0121.github.io/danielk-blog/
- 빌드/배포 : github actions, pages
- 마크다운 웹빌더 : hugo
- 테마 : PagerMod
  - 데모 페이지 : https://adityatelange.github.io/hugo-PaperMod/
  - 데모 페이지 소스 : https://github.com/adityatelange/hugo-PaperMod/tree/exampleSite


---
## todo task
- [x] 우상단 메뉴 버튼 추가 : 아카이브, 서치, 태그
- [x] 홈페이지 소개글 추가
- [x] 이미지 있는 게시글 테스트 (이미지 상대 경로 테스트)
- [x] 게시글 정렬 기준 파악 및 제어
- [x] 배포 브랜치 분리
- [ ] 파비콘 이미지 등록
- [ ] 페이징 more 기능 추가
- [ ] 게시글 > 메타정보 > 날짜 입력 방법 개선
- [ ] 테마 변경 후 테스트
- [ ] SEO (검색 엔진 최적화)
- [ ] 페이지 조회수 등 통계 기능 추가 : [add_ga.md](todo_task_md/add_ga.md)
- [ ] 광고 붙이기
- [ ] hugo 도커 사용 테스트
- [ ] 문서 내용 분석으로, 태그 자동 입력 기능 못하는가 ?
- [ ] 문서들을 한 폴더에 모을 수 있나 ?
- [ ] 기존 깃헙 메모장 형식의 레포를 블로그로 이전
  - [ ] chat-using-gemini : 단순 이전
  - [ ] my_aws_test : 계층 구조 필요
  - [ ] loadmap : 블로그로 이전하면, 묻혀질까봐 걱정
- [x] 모바일 환경 개선 > 폰트 크기 줄이기
- [x] 모바일 환경 개선 > 테이블 내 폰트 크기가 너무 큼
- [ ] pc 환경 개선 > 메인 > 포스트 썸네일 이미지 사이즈 축소, 모바일은 현행 유지


---
## Hugo 사용 기록
- 게시글 정렬 기준 파악 및 제어
  - weight : front matter 에 weight 추가, 값이 작은 순서대로 먼저 배치됨
  - date : 가중치가 같거나 없을 경우, 최신 날짜가 먼저 배치
  - title : 날짜까지 동일한 조건이면, 제목의 알파벳 순서로 정렬
  - filepath : 모든 조건이 같으면, 파일 시스템상의 경로 순서로 정렬
- draft, 초안, 미리보기
  - Hugo 설정에서 draft: true는 해당 콘텐츠가 '초안(Draft)' 상태임을 의미합니다.
  - 미리보기 : 
    - 로컬에서 작업 중 확인하고 싶다면 hugo server -D 또는 
    - hugo server --buildDrafts 명령어를 사용하면 초안까지 포함해서 볼 수 있습니다. 
- ㅁㄴㅇㄹ
