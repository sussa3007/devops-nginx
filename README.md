# Nginx Docker 설정

이 저장소는 Nginx 웹 서버의 Docker 환경 구성을 포함하고 있습니다.

## 디렉토리 구조

- `conf/`: Nginx 메인 설정 파일
- `sites/`: 가상 호스트 설정 파일
- `certs/`: SSL 인증서 파일 (수동으로 복사 필요)
- `logs/`: Nginx 로그 파일
- `html/`: 웹 콘텐츠 파일

## 사용 방법

### SSL 인증서 복사

Docker 컨테이너에서 SSL을 사용하기 위해 인증서 파일을 `certs/` 디렉토리에 복사해야 합니다.
```bash
# 이 명령은 root 권한으로 실행해야 할 수 있습니다
sudo cp /etc/letsencrypt/live/server-su.site/* ~/nginx-docker/certs/
```

### Docker 이미지 빌드 및 컨테이너 실행

```bash
cd ~/nginx-docker
docker-compose up -d
```

### 로그 확인

```bash
docker-compose logs -f nginx
```

### 컨테이너 중지

```bash
docker-compose down
```

## 참고 사항

- 설정 파일을 수정한 후에는 컨테이너를 재시작해야 합니다:
  ```bash
  docker-compose restart nginx
  ```
- SSL 인증서가 갱신된 경우, 인증서 파일을 다시 복사하고 컨테이너를 재시작해야 합니다.
