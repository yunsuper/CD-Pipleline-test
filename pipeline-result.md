# CI/CD Pipeline 실행 결과 보고서

## 1. 로컬 환경 테스트

- Gradle을 이용하여 인수 테스트를 실행
- `mul` 기능에 대한 모든 테스트 케이스가 성공적으로 통과함

---

## 2. Git Repository Push 및 파이프라인 트리거

- 코드가 Git Repository에 Push됨
- Jenkins Pipeline이 자동으로 트리거됨
- Pipeline 내 Test 단계가 실행됨

---

## 3. 파이프라인 실행 결과

### Test Stage
- JUnit 기반 인수 테스트 실행
- 모든 테스트 성공 (BUILD SUCCESSFUL)

### Deploy Stage
- Terraform Apply 단계 실행
- Kubernetes 리소스 생성/업데이트 수행

---

## 4. Console Output (요약)

```text
> Task :test
BUILD SUCCESSFUL
All tests passed
