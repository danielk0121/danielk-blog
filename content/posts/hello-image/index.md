---
date: '2026-01-31T23:00:00+09:00'
draft: false
title: 'Hello 이미지'
tags: ["hugo", "이미지", "아_개고생", "이미지_상대경로_고생", "태그_가_추가_된다"]
cover:
  image: "images/01.png"
  alt: "커버 이미지 alt"
  caption: "이미지 아래에 표시될 문구"
  relative: true # when using page bundles set this to true
  hidden: false # only hide on current single page
---

---
## 페이지 번들 사용시, index.md 파일명 주의 !!!
- 페이지 번들 공식 문서 : 
  - https://gohugo.io/content-management/page-bundles/
- index.md 외 다른 파일명 사용
```
/content/posts/some_title/here.md
/content/posts/some_title/01.jpg
=> 
https://domain/my-blog/posts/some_title/here/ => 게시글
https://domain/my-blog/posts/some_title/here/01.jpg => 이 주소가 아님, 이미지 접근 불가 !!
```
- 페이지 번들 사용 => /content/xxx/<게시글_제목>/index.md
```
/content/posts/some_title/index.md
/content/posts/some_title/images/01.jpg  
=> 
https://domain/my-blog/posts/some_title/ => 게시글
https://domain/my-blog/posts/some_title/images/01.jpg => 이미지 접근
```
- 물론, /static/ 폴더를 사용 할 수 있다 (비권장)


---
## 헬로 이미지 2
- ㅁㄴㅇㄹ
- asdf
- qwer

---
## 헬로 헬로 헬로 테스트
- 1234
- zxcv

---
![고양이_이미지](images/02.jpeg)
![고양이_이미지](images/03.jpeg)

asdfasdfasdf
qwreqwerqwre
