source("util.r")

# C로 작성된 코사인 유사도 라이브러리 로드
dyn.load("cosine_similarity.so")

# microbenchmark 패키지 설치 및 로드
install_and_load("microbenchmark")

cosine_similarity <- function(vector_a, vector_b) {
    # 벡터 길이 확인
    if (length(vector_a) != length(vector_b)) {
        stop("벡터의 길이가 같아야 합니다")
    }

    # 벡터가 비어있는지 확인    
    if (length(vector_a) == 0) {
        stop("벡터는 비어있을 수 없습니다")
    }
    
    # 코사인 유사도 계산
    dot_product <- sum(vector_a * vector_b)
    magnitude_a <- sqrt(sum(vector_a * vector_a))
    magnitude_b <- sqrt(sum(vector_b * vector_b))
    
    # 벡터의 크기가 0인지 확인
    if (magnitude_a == 0 || magnitude_b == 0) {
        stop("벡터의 크기가 0일 수 없습니다")
    }
    
    # 코사인 유사도 반환
    return(dot_product / (magnitude_a * magnitude_b))
}

cosine_similarity_c <- function(vectorA, vectorB) {
	# 벡터가 숫자형인지 확인
	if (!is.numeric(vectorA) || !is.numeric(vectorB))
		stop("arguments must be numeric")
	
	# 벡터의 길이가 같은지 확인
	if (length(vectorA) != length(vectorB))
		stop("vectors must be of the same length")
	
	# 벡터의 길이 계산
	len <- length(vectorA)

	# C 함수 호출
	out <- .C("cosine_similarity",
			len=as.integer(len),
			vectorA=as.double(vectorA),
			vectorB=as.double(vectorB),
			result=as.double(0))
	
	return(out$result)
}

# 난수 고정
set.seed(123)  # 난수 고정

# 대규모 벡터 생성
n <- 1e7
vector1 <- as.double(runif(n))
vector2 <- as.double(runif(n))

# 벡터 출력
cat("Vector1 first 3 elements: ", vector1[1:3], "\n")  # 벡터의 처음 4개 요소 출력
cat("Vector2 first 3 elements: ", vector2[1:3], "\n")  # 벡터의 처음 4개 요소 출력

# 코사인 유사도 계산 출력
result <- cosine_similarity(vector1, vector2)
cat(sprintf("R result: %f\n", result))

result <- cosine_similarity_c(vector1, vector2)
cat(sprintf("C result: %f\n", result))

# 성능 비교
benchmark_result <- microbenchmark(
    R = cosine_similarity(vector1, vector2),
    C = cosine_similarity_c(vector1, vector2),
    times = 10
)

# 결과 출력
print(benchmark_result)

# C로 작성된 라이브러리 언로드
dyn.unload("cosine_similarity.so")