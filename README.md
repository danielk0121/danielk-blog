## 참고
- PagerMod 테마 사용
  - 데모 페이지 : https://adityatelange.github.io/hugo-PaperMod/
  - 데모 페이지 소스 : https://github.com/adityatelange/hugo-PaperMod/tree/exampleSite
- 빌드/배포 : github actions, pages
- 배포 url : https://danielk0121.github.io/danielk-blog/

---
## todo
- [x] 우상단 메뉴 버튼 추가 : 아카이브, 서치, 태그
- [x] 홈페이지 소개글 추가
- [x] 이미지 있는 게시글 테스트 (이미지 상대 경로 테스트)
- [x] 게시글 정렬 기준 파악 및 제어
- [ ] 페이징 more 기능 추가

---
## 메모
- 게시글 정렬 기준 파악 및 제어
  - weight : front matter 에 weight 추가, 값이 작은 순서대로 먼저 배치됨
  - date : 가중치가 같거나 없을 경우, 최신 날짜가 먼저 배치
  - title : 날짜까지 동일한 조건이면, 제목의 알파벳 순서로 정렬
  - filepath : 모든 조건이 같으면, 파일 시스템상의 경로 순서로 정렬
- asdf
- 
