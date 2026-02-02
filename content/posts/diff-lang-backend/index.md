---
date: '2026-02-02T22:55:00+09:00'
draft: false
title: '백엔드 언어 특징 비교'
tags: ["백엔드", "언어_비교", "python", "js", "typescript", "java", "php", "kotlin", "go", "rust"]
---


---
### 간략한 비교

| 구분        | **Python** | **JS/TS** | **Java** | **PHP** | **Kotlin** | **Go** | **Rust** |
|:----------| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| 인기도       | 1위 | 2위 | 3위 | 4위 | 5위 | 6위 | 7위 |
| 빌드/컴파일 시간 | 없음 (인터프리터) | 없음/빠름 (JIT) | 느림 (JVM 빌드) | 없음 (인터프리터) | 느림 (Java보다 늦음) | **매우 빠름** | **매우 느림** |
| 배포 용이성    | 보통 (의존성 관리 필요) | **매우 쉬움** | 보통 (JAR 배포) | **매우 쉬움** (파일 배포) | 보통 (JAR 배포) | **매우 쉬움 (단일 바이너리)** | 쉬움 (단일 바이너리) |
| 멀티 코어 사용  | ⚠️ 제한적 (GIL) | ⚠️ 제한적 (Single Thread) | **최적화됨** | ❌ 불리 (프로세스 단위) | **최적화됨** | **최고** (Goroutine) | **최고** (Fearless Concurrency) |
| 추천 프레임워크  | FastAPI | NestJS | Spring Boot | Laravel | Spring Boot | Gin | Axum |


---
### 주요 특징

| 언어 | 특징 요약                                 |
| :--- |:--------------------------------------|
| **Python** | **AI/데이터 과학 독점**, 생산성 극대화                 |
| **JS/TS** | **풀스택 유리**, I/O 작업에 강함, 의존성 설치 시간이 변수     |
| **Java** | 대규모 엔터프라이즈, **안정적인 생태계**                  |
| **PHP** | 웹 전용, 저렴한 운영, CMS 시장 장악, **즉시 반영의 끝판왕**   |
| **Kotlin** | 자바 완벽 호환, **간결한 현대적 문법**                  |
| **Go** | **고성능 동시성**, 클라우드 인프라 최적화, 바이너리 생성 속도 독보적 |
| **Rust** | 메모리 안전성 보장, **C++급 성능**, 빌드 중 안전성 검사 수행 |


---
### 타입 시스템  비교

| 언어 | 타입 방식 | 특징 |
| :--- | :--- | :--- |
| **Rust** | **정적 타입** (Static) | 컴파일 시 엄격한 검사로 런타임 오류 최소화, 높은 안정성. 학습 곡선 높음, 컴파일 시간이 김. |
| **Go** | **정적 타입** (Static) | 단순하고 명시적, 빠른 컴파일 속도. 일부 고급 추상화 기능 부족. |
| **Java** | **정적 타입** (Static) | 타입 안정성 및 코드 예측 용이, 대규모 프로젝트 적합. 코드가 장황해질 수 있음. |
| **Kotlin** | **정적 타입** (Static) | Java 호환, 간결한 문법, 안전성 높음. 결국 JVM 위 실행, 극단적 성능 최적화는 어려움. |
| **JS/TS** | **동적 타입 -> 정적 타입** | TypeScript 도입으로 안정성 확보, 풀스택 개발 용이. JS 자체는 실행 중 오류 발생 가능성 높음. |
| **Python** | **동적 타입** (Dynamic) | 코드가 간결하고 개발 속도 빠름. 실행 중 타입 오류 발생 가능성, 안정성 낮음. |
| **PHP** | **동적 타입** (Dynamic) | 유연한 개발 가능, 빠른 배포 및 수정. 타입 관련 오류가 런타임에 발생. |


---
### 추가. Gin 프레임워크

깃헙 주소 : https://github.com/gin-gonic/gin  
아래 내용은 깃헙 리드미 발췌

Gin은 Go 언어로 작성된 고성능 HTTP 웹 프레임워크입니다.  
Martini와 유사한 API를 제공하지만, httprouter 덕분에 최대 40배 빠른 성능을 자랑합니다.  
Gin은 속도와 개발자 생산성이 중요한 REST API, 웹 애플리케이션 및 마이크로서비스 구축에 최적화되어 있습니다.  

**Gin을 선택해야 하는 이유:**

Gin은 Express.js 스타일의 간편한 라우팅과 Go의 뛰어난 성능을 결합하여 다음과 같은 용도에 이상적입니다.

- 높은 처리량의 REST API 구축
- 다수의 동시 요청을 처리해야 하는 마이크로서비스 개발
- 빠른 응답 속도가 필요한 웹 애플리케이션 개발
- 최소한의 보일러플레이트 코드로 웹 서비스 프로토타입을 신속하게 제작

**Gin의 주요 기능:**

- **제로 메모리 할당 라우터** - 힙 할당 없이 매우 효율적인 메모리 라우팅 제공
- **고성능** - 벤치마크 결과 다른 Go 웹 프레임워크 대비 우수한 속도 제공
- **미들웨어 지원** - 인증, 로깅, CORS 등을 위한 확장 가능한 미들웨어 시스템
- **크래시 방지** - 내장 복구 미들웨어로 패닉 발생 시 서버 다운 방지
- **JSON 유효성 검사** - 요청/응답 JSON 바인딩 및 유효성 검사 자동 수행
- **라우트 그룹화** - 관련 라우트를 구성하고 공통 미들웨어 적용
- **오류 관리** - 중앙 집중식 오류 처리 및 로깅
- **내장 렌더링** - 다양한 렌더링 기능 지원 JSON, XML, HTML 템플릿 등 지원
- **확장 가능** - 방대한 커뮤니티 미들웨어 및 플러그인 생태계 제공

1. Save the code above as main.go
```go
package main

import (
  "log"
  "net/http"

  "github.com/gin-gonic/gin"
)

func main() {
  // 소문자 : 내부함수명, 패키지명, 변수명 
  // 대문자 : 외부공개 함수명
  // := 연산자 : 변수 선언 + 대입 + 타입 추론
  // 리턴이라서 r 인거 같음
  // Create a Gin router with default middleware (logger and recovery)
  r := gin.Default()

  // Define a simple GET endpoint
  // 고랭은 변수 먼저, 타입 나중에
  r.GET("/ping", func(c *gin.Context) {
    // Return JSON response
    c.JSON(http.StatusOK, gin.H{
      "message": "pong",
    })
  })

  // Start server on port 8080 (default)
  // Server will listen on 0.0.0.0:8080 (localhost:8080 on Windows)
  if err := r.Run(); err != nil {
    log.Fatalf("failed to run server: %v", err)
  }
}
```

2. Run the application:
```go run main.go```

3. Open your browser and visit http://localhost:8080/ping


