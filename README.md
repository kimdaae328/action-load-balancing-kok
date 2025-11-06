# 로드 밸런싱 (Load Balancing)

## 개요

**로드 밸런싱(Load Balancing)** 은 사용자의 요청(트래픽)을 여러 서버로 분산시켜 시스템의 **부하를 균등하게 분배**하고, **서비스 안정성과 가용성**을 높이는 기술이다.  

즉, 한 서버에만 요청이 몰려 다운되거나 느려지는 문제를 방지하고 여러 서버가 협력하여 하나의 서비스처럼 동작하도록 한다.

---

## 주요 개념

| 개념 | 설명 |
|------|------|
| **Load Balancer (LB)** | 클라이언트 요청을 여러 서버에 분산시키는 중간 관리자 역할 |
| **Target Group** | 로드 밸런서가 분산시킬 대상 서버(EC2, 컨테이너 등)의 집합 |
| **Health Check** | 서버의 상태를 주기적으로 점검하여, 정상인 서버로만 트래픽을 전달 |

---

## Load Balancing 주요 알고리즘

### 라운드 로빈 (Round Robin)
요청이 들어올 때마다 **서버에 순차적으로 분배**하는 방식입니다.  
구현이 간단하고 모든 서버에 **균등하게 트래픽을 분산**할 수 있습니다.

### 최소 연결 (Least Connections)
현재 **가장 적은 연결 수를 가진 서버로 요청을 전달**합니다.  
트래픽 부하가 일정하지 않거나, 요청 처리 시간이 서버마다 다를 때 **효율적인 부하 분산**이 가능합니다.

### IP 해시 (IP Hash)
**클라이언트의 IP 주소를 기준으로 요청을 특정 서버에 고정**시킵니다.  
같은 사용자가 항상 동일한 서버에 연결되므로, **세션 유지가 필요한 서비스**에 적합합니다.

---

## 로드 밸런싱 구조 예시
- **로드 밸런서 (AWS ELB 또는 Nginx)**  
  → 트래픽을 두 개 이상의 EC2 인스턴스(Spring 서버)로 분산  

- **EC2 서버**  
  → 각각 Docker 컨테이너로 Spring Boot 애플리케이션을 실행  

- **RDS / Redis**  
  → 모든 서버가 공유하는 데이터베이스 및 캐시 서버


## 동작 방식

1. 사용자가 서비스에 접속하면 요청이 **로드 밸런서로 먼저 전달**된다.  
2. 로드 밸런서는 **서버의 상태(Health Check)** 를 확인한다.  
3. 정상 상태인 서버 중 하나를 선택해 트래픽을 전달한다.  
4. 한 서버에 과부하가 발생하면 다른 서버로 요청을 분산시킨다.  
5. 서버 한 대가 다운되더라도 나머지 서버가 서비스를 계속 유지한다.

---

## 설치
```
# 설치 명령어
~$ sudo apt install -y nginx

# 상태 확인
~$ sudo systemctl status nginx

# 파일 만들기
~$ sudo vim /etc/nginx/sites-available/(프로젝트 명)

   # 설정 작성
   upstream (프로젝트 명) {
      least_conn; 	
      server ipaddress1:80;  # 첫 번째 EC2 	
      server ipaddress2:80;  # 두 번째 EC2
   }
   server {
      listen 80;

      location / {
         proxy_pass http://(프로젝트 명);
         proxy_set_header Host $host;
         proxy_set_header X-Real-IP $remote_addr;
      }
   }

# 기존 링크 삭제하기
~$ sudo rm /etc/nginx/sites-enabled/default

# 만든 파일 링크 걸어주기
~$ sudo ln -s /etc/nginx/sites-available/(프로젝트 명) /etc/nginx/sites-enabled/

# 확인하기
~$ ls -l /etc/nginx/sites-enabled/

# 설정한 파일 테스트
~$ sudo nginx -t
```
---

## 워크플로우 단계
<img width="2560" height="1440" alt="cicd2" src="https://github.com/user-attachments/assets/b9a9ff12-12d2-4018-a7e8-1cac09e27b61" />
