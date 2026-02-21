# R과 C 연동 예제

## 01 간단한 C 호출 예제

## 02 R 로만 작성한 함수 예제

## 03 C로 작성한 함수를 R에서 호출 하는 예제

## 04 C와 R에서 작성 된 함수들을 성능 테스트 하는 예제


### 각각 폴더에 있는 run.sh 이용방법

본 파일은 포함된 C파일을 필드를 하고 Rscript로 실행을 한다.

``` bash
sudo chmod +x run.sh
./run.sh
```

R언어 설치 방법은 개인이 찾아서 설치

### R로 작성된 함수랑 C함수와 성능 비교

```
 expr       min       lq     mean   median       uq      max neval cld
    R 125.70576 127.8125 142.1501 142.8642 154.7482 160.3446    10  a
    C  93.35073  99.3737 104.7097 105.1895 110.3764 118.3262    10   b
```

#### 참고

각각 언어별 Cosine Similarity 함수 예제(약 14개 언어)
https://github.com/bluetsys/cosine_similarity