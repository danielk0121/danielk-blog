# Hugo PaperMod 테마에 Waline 조회수/댓글 기능 연동하기

Hugo 기반의 **PaperMod** 테마에서 **Waline**을 사용하여 포스트별 실시간 조회수와 댓글 기능을 추가하는 방법입니다.

---
## 1단계: 데이터베이스(LeanCloud) 설정

Waline의 데이터를 저장할 무료 DB를 생성합니다.

1. [LeanCloud(International)](https://www.leancloud.app) 가입 및 로그인
2. **Create App** 클릭 → 앱 이름 설정 → 생성
3. **Settings > App Keys** 메뉴에서 아래 3가지 값 복사:
   - `App ID`
   - `App Key`
   - `Master Key`

---
## 2단계: 서버(Vercel) 배포

Waline 엔진을 구동할 서버를 무료로 호스팅합니다.

1. [Waline Vercel 배포 템플릿](https://vercel.com) 접속
2. GitHub 계정으로 로그인 및 Repository 이름 설정
3. **Environment Variables**에 1단계에서 복사한 값 입력:
   - `LEAN_ID`: (App ID 입력)
   - `LEAN_KEY`: (App Key 입력)
   - `LEAN_MASTER_KEY`: (Master Key 입력)
4. **Deploy** 버튼 클릭 후 배포된 **서버 URL** (예: `https://my-blog-waline.vercel.app`) 복사

---
## 3단계: 블로그 설정 파일 수정 (`hugo.yaml`)

블로그 설정 파일에 Waline 정보를 등록합니다.

```yaml
params:
  env: "production" # GA 및 Waline 활성화를 위해 필요
  
  waline:
    enable: true
    serverURL: "https://본인의-vercel-주소.vercel.app" # 2단계에서 복사한 주소
    pageview: true # 조회수 기능 활성화
    comment: true  # 댓글 기능 활성화
```

---
## 4단계: 레이아웃 코드 추가

① 스크립트 초기화 (layouts/partials/extend_footer.html)
Waline을 실행하기 위한 스크립트를 추가합니다. 파일이 없다면 생성하세요.

```html
<script type="module">
  import { init } from 'https://unpkg.com';
  init({
    el: '#waline',
    serverURL: '{{ .Site.Params.waline.serverURL }}',
    pageview: true,
  });
</script>
```

② 조회수 표시 위치 설정 (layouts/partials/post_meta.html)
포스트 상단 메타 정보(날짜 등) 옆에 조회수를 표시합니다. (테마 원본 파일 복사 후 수정 권장)

```html
<span id="{{ .RelPermalink }}" class="leancloud_visitors" data-flag-title="{{ .Title }}">
  &nbsp;·&nbsp;<span>조회수 </span>
  <span class="waline-pageview-count">...</span>
</span>
```

③ 댓글창 표시 (layouts/_default/single.html)
본문 하단에 댓글창이 나타날 위치를 지정합니다.

```html
{{- if .Site.Params.waline.enable -}}
  <div id="waline"></div>
{{- end -}}
```

---
## 5단계: 관리자 계정 생성

- 배포된 서버 URL 뒤에 /ui/register를 붙여 접속한 뒤 첫 계정을 만듭니다.
  - 예: https://your-app.vercel.app
  - 첫 번째 가입자가 자동으로 관리자가 됩니다.

---
## 참고 링크

- Waline 공식 가이드
- PaperMod 공식 문서

---

이제 이 과정을 모두 마치셨다면, 깃허브에 **Push**하여 실제 블로그에서 조회수가 올라가는지 확인해 보세요!
**Vercel 주소**가 정확히 입력되었는지 한 번 더 확인하시는 것이 중요합니다.
 
설정 중 특정 파일 위치를 찾기 어렵거나 **CSS 스타일**이 깨져 보인다면 바로 말씀해 주세요!

---

## 추가

마지막으로 정리한 마크다운 문서에 ga 키를 입력하는 내용이 안보이는데 이게 맞나 ?

맞습니다! 제가 Waline(조회수/댓글) 연동에 집중하느라 GA(구글 애널리틱스) 설정 부분을 마크다운 문서에서 빠뜨렸네요.
GA4는 Hugo 내장 기능을 사용하기 때문에 hugo.yaml에 키값만 넣으면 됩니다. 
수정된 최종 마크다운 가이드를 다시 정리해 드립니다.

## 1단계: Google Analytics 4 (GA4) 설정
1. [Google Analytics](https://analytics.google.com)에서 `G-XXXXXXXXXX` 측정 ID 발급
2. `hugo.yaml` 파일 최상단에 아래 내용 추가:
   - hugo.yaml 파일에서 googleAnalytics는 특정 그룹(params 등) 안에 속하지 않는 최상위 루트(Root) 레벨에 위치해야 합니다.

```yaml
# hugo.yaml 예시
baseURL: "https://danielk0121.github.io"
title: "My Blog"
theme: "PaperMod"

# --- 여기에 추가하세요 ---
googleAnalytics: "G-XXXXXXXXXX"
# -----------------------

params:
  env: "production"
  # (이하 생략)
```

---











