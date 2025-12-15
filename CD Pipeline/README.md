본 과제는 Kubernetes 환경에서 Staging / Production 환경을 분리하여
CD(Continuous Deployment) 파이프라인을 설계하는 것을 목표로 한다.

실제 운영 환경에서는 Terraform, Kubernetes, Jenkins를 연계하여
애플리케이션 빌드부터 배포까지 자동화된 파이프라인을 구축한다.

본 과제에서는 실습 환경의 제약으로 인해 실제 배포는 수행하지 않고,
구성 설계와 배포 흐름 이해를 중심으로 문서화하였다.

본 실습은 다음과 같은 제약 조건을 가진다.
- 단일 Kubernetes 클러스터만 사용 가능 (Docker Desktop 환경)
- 클러스터 외부에서의 접근 제한
- Jenkins 및 Terraform Cloud 실제 연동 미실시
- 실습 자료 및 예제 코드 미제공

이에 따라 다중 클러스터 환경을 직접 구성하지 않고,
하나의 클러스터 내에서 Namespace를 분리하여 환경을 시뮬레이션하는 방식을 채택하였다.

실제 운영 환경 기준
- Staging / Production 각각 별도의 Kubernetes 클러스터 사용
- Jenkins Credentials를 통해 클러스터 접근 정보 분리
- Terraform Cloud Workspace를 환경별로 분리 관리

본 실습에서의 적용 방식
- 단일 Kubernetes 클러스터 사용
- Namespace를 통해 환경 분리
  - dev → Staging 환경
  - prod → Production 환경
- 동일한 Terraform 코드를 사용하되, 환경별 차이는 tfvars 파일로 분리하여 적용

CD 파이프라인 흐름 (설계)
1. Git Repository에 코드 Push
2. Jenkins Pipeline 트리거
3. Docker Image Build
4. Image Registry Push
5. Terraform Apply (환경별 tfvars 적용)
6. Kubernetes Deployment 업데이트

본 과제는 실제 배포 실행이 아닌, CD 파이프라인 설계 및 IaC 구조 이해를 목표로 수행되었다.