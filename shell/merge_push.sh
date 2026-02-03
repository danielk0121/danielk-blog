#!/bin/bash

# 에러 발생 시 스크립트 중단
set -e

echo "1. 로컬 저장소 정보 업데이트 중..."
git fetch origin

echo "2. release 브랜치로 전환 중..."
git checkout release

echo "3. 최신 release 상태 반영 (pull)..."
git pull origin release

echo "4. master 브랜치를 release로 머지 중..."
git merge origin/master

echo "5. 변경 사항을 원격 release 브랜치로 푸시 중..."
git push origin release

echo "성공적으로 master가 release에 머지되고 푸시되었습니다!"

echo "다시 master 브랜치로 체크아웃 합니다"
git checkout master
