#!/bin/bash

# 에러 발생 시 스크립트 즉시 중단
set -e

# --- 설정 변수 ---
MASTER_BRANCH="master"
RELEASE_BRANCH="release"

# --- 로그 함수 ---
log_info() {
  echo "[INFO] $1"
}

log_warn() {
  echo "[WARN] $1"
}

# 에러 메시지 출력 후 즉시 종료 (if 문 등에서 사용)
die() {
  echo "[ERROR] $1"
  exit 1
}

# --- 스크립트 시작 ---
log_info "----------------------------------------------------"
log_info "         Master 브랜치를 Release 브랜치로 병합 및 푸시"
log_info "----------------------------------------------------"

# 커밋되지 않은 변경 사항 확인
if ! git diff-index --quiet HEAD --; then
  die "커밋되지 않은 변경 사항이 있습니다. 먼저 커밋하거나 스태시하십시오."
fi

log_info "1. ${MASTER_BRANCH} 브랜치로 전환 중..."
git checkout "${MASTER_BRANCH}"

log_info "2. 원격 저장소 정보 업데이트 및 ${MASTER_BRANCH} 최신화 (pull)..."
git pull origin "${MASTER_BRANCH}"

log_info "3. ${RELEASE_BRANCH} 브랜치로 전환 중..."
git checkout "${RELEASE_BRANCH}"

log_info "4. 최신 ${RELEASE_BRANCH} 상태 반영 (pull)..."
git pull origin "${RELEASE_BRANCH}"

log_info "5. ${MASTER_BRANCH} 브랜치를 ${RELEASE_BRANCH}로 병합 중..."
# --no-ff 옵션으로 병합 커밋을 항상 생성하여 이력을 명확하게 유지
git merge --no-ff "origin/${MASTER_BRANCH}" -m "Merge branch '${MASTER_BRANCH}' into '${RELEASE_BRANCH}'"

log_info "6. 변경 사항을 원격 ${RELEASE_BRANCH} 브랜치로 푸시 중..."
git push origin "${RELEASE_BRANCH}"

log_info "----------------------------------------------------"
log_info "  성공적으로 ${MASTER_BRANCH}가 ${RELEASE_BRANCH}에 병합되고 푸시되었습니다!"
log_info "----------------------------------------------------"

# 스크립트 완료 후 항상 master 브랜치로 돌아가기
log_info "스크립트 완료 후 ${MASTER_BRANCH} 브랜치로 돌아갑니다."
git checkout "${MASTER_BRANCH}"

log_info "스크립트 완료."
