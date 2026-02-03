---
date: '2026-01-31T16:00:00+09:00'
draft: false
title: 'Hugo 휴고 설치'
tags: ["#Hugo","#휴고설치","#블로그구축","#깃허브페이지","#깃허브액션","#정적사이트생성기","#마크다운","#맥북","#테마설정","#자동배포"]
---

## 개요
- 로컬 맥북에 Hugo 휴고를 설치하고, 깃헙 액션과 페이지로 최초 배포 해보는 과정을 날것으로 기록
- 아래 "목적, 조건, 추가질문" 내용은 채팅 AI 에게 반복적으로 던지는 내용

---
## AI용 질문 문서

```markdown
## 목적
- 마크다운 파일을 작성해서 웹 블로그로 포스팅하는 작업을 하려고 한다
- hugo 를 사용하는 방법을 순서대로 알려줘

## 조건
- 깃허브 계정 이미 있음
- github 레포지토리 없음
- github 액션 사용 경험 없음
- github 페이지 사용 경험 없음
- 맥사용
- git 설치 되어 있음
- hugo 미설치

## 추가 질문
- hugo new site danielk-blog --format yaml 명령어로 프로젝트를 생성하니까, 
  - 루트 폴더 하위에 hugo.yaml 파일이 생겼는데
  - .github/workflows/hugo.yml 이 파일을 또 만들어 ?
```
  
---
## 설치 기록

```shell
# 설치 명령 : 
brew install hugo

# 설치가 몇분 걸린다, 좀 무거운듯
# 도커 사용이 가능한지 알아봐야겠다
# 정정, 로그를 다시 보니, go 를 설치하는데 오래걸린 것으로 보임

# 사이트 생성 :
hugo new site danielk-blog --format yaml

# 폴더 진입 :
cd danielk-blog

# Git 시작 : (이 폴더를 관리 대상으로 등록합니다.)
git init

# 테마 다운로드
# needed when you reclone your repo (submodules may not get cloned automatically)
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
git submodule update --init --recursive

# 설정 파일 수정: hugo.yaml 파일을 열어 아래 내용을 추가(또는 수정)하세요.
theme: ["PaperMod"]

# 새 글 생성:
hugo new posts/hello-world.md

# 내용 수정: content/posts/hello-world.md 파일을 열고, 
# 상단의 draft: true를 draft: false로 바꾼 뒤 아래에 내용을 적으세요.
content/posts/hello-world.md

# 미리보기: hugo server 명령 후 브라우저에서 http://localhost:1313 접속.
hugo server

# 깃헙에서 저장소 생성
# public 체크
# 로컬 git 코드 내용 푸시


# GitHub Actions로 자동 배포 설정

# 워크플로우 파일 생성: .github/workflows/hugo.yml 파일을 만듭니다. (폴더가 없으면 만드세요)

# 두 yml 파일 차이점
# - 루트폴더 하위 hugo.yaml: "내 블로그는 이렇게 생겨야 해" (내용물 설정)
# - .github/workflows/deploy.yml: "GitHub야, 내가 코드 올리면 이걸로 웹사이트 만들어줘" (배포 과정 설정)

```
